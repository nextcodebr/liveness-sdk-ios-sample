//
//  Service.swift
//  NXCDLivenessSDK_Example
//
//  Created by lucasbrito on 21/09/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation

private enum Endpoints: String {
    case testing = "https://api-homolog.nxcd.app/full-ocr/v3"
    case production = "https://api.nxcd.app/full-ocr/v3"
}

class Service {
    private let defaultSession = URLSession(configuration: .default)
    private var dataTask: URLSessionDataTask?
    
    private let isTest: Bool
    private let apiKey: String
    
    init(isTest: Bool, apiKey: String) {
        self.isTest = isTest
        self.apiKey = apiKey
    }
    
    func getFullOCR(dataArray: [Data], completion: @escaping (_ result: [String: Any]?) -> Void) {
        dataTask?.cancel()
        
        let endpoint = isTest ? Endpoints.testing : Endpoints.production
        
        guard let url = URL(string: endpoint.rawValue) else {
            completion(nil)
            return
        }
        
        let boundary = "Boundary-\(UUID().uuidString)"
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("ApiKey \(apiKey)", forHTTPHeaderField: "Authorization")
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.httpBody = createBody(parameters: [:], boundary: boundary, dataArray: dataArray, mimeType: "image/jpeg")
        
        dataTask = defaultSession.dataTask(with: request) { (data, response, error) in
            if let error = error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            guard let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(nil)
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    completion(json)
                    return
                }
            } catch let error as NSError {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
        }
        
        dataTask?.resume()
    }
    
    private func createBody(parameters: [String: String], boundary: String, dataArray: [Data], mimeType: String) -> Data {
        let body = NSMutableData()
        let boundaryPrefix = "--\(boundary)\r\n"

        for (key, value) in parameters {
            body.appendString(boundaryPrefix)
            body.appendString("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
            body.appendString("\(value)\r\n")
        }
        
        var filename = String()
        for (index, data) in dataArray.enumerated() {
            filename = "image\(index)"
            body.appendString(boundaryPrefix)
            body.appendString("Content-Disposition: form-data; name=\"image[]\"; filename=\"\(filename)\"\r\n")
            body.appendString("Content-Type: \(mimeType)\r\n\r\n")
            body.append(data)
            body.appendString("\r\n")
        }
        body.appendString("--".appending(boundary.appending("--")))

        return body as Data
    }
}

extension NSMutableData {
    func appendString(_ string: String) {
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: false)
        append(data!)
    }
}
