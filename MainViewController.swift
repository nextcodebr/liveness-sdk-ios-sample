//
//  MainViewController.swift
//  NXCDLivenessSDK_Example
//
//  Created by lucasbrito on 21/09/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import NXCDLivenessSDK

struct InstructionsModel {
    var instructionOne: String
    var instructionTwo: String
    var instructionThree: String
    var instructionFour: String
    var instructionFive: String
    var instructionFiveIsHidden: Bool
}

class MainViewController: UIViewController {
    //MARK: - Views
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Como posso\nte ajudar\nhoje?"
        label.textAlignment = .natural
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 48.0, weight: .regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let captureFaceButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("CAPTURAR UMA FACE", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4.0
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let captureDocumentButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("CAPTURAR UM DOCUMENTO", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4.0
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupUX()
    }
    
    //MARK: - Setups
    private func setupUI() {
        view.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        containerView.addSubview(titleLabel)
        titleLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 44.0).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 44.0).isActive = true
        
        
        containerView.addSubview(captureFaceButton)
        captureFaceButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32.0).isActive = true
        captureFaceButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 44.0).isActive = true
        captureFaceButton.heightAnchor.constraint(equalToConstant: 42.0).isActive = true
        captureFaceButton.widthAnchor.constraint(equalToConstant: 224.0).isActive = true
        
        
        containerView.addSubview(captureDocumentButton)
        captureDocumentButton.topAnchor.constraint(equalTo: captureFaceButton.bottomAnchor, constant: 32.0).isActive = true
        captureDocumentButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 44.0).isActive = true
        captureDocumentButton.heightAnchor.constraint(equalToConstant: 42.0).isActive = true
        captureDocumentButton.widthAnchor.constraint(equalToConstant: 272.0).isActive = true
    }
    
    private func setupUX() {
        captureFaceButton.addTarget(self, action: #selector(goToCaptureFace), for: .touchUpInside)
        captureDocumentButton.addTarget(self, action: #selector(goToCaptureDocument), for: .touchUpInside)
    }
    
    //MARK: - Fuctions
    @objc private func goToCaptureFace() {
        let appearance = LivenessCameraViewControllerAppearance(
            hideCloseButton: false,
            closeButtonColor: .white,
            footerBackgroundColor: .white,
            footerCornderRadius: 6.0,
            instructionsFont: .preferredFont(forTextStyle: .headline),
            instructionsTextColor: .black,
            faceCutoutBackgroundColor: UIColor.black.withAlphaComponent(0.5),
            faceCutoutPositiveColor: UIColor.green,
            faceCutoutNegativeColor: UIColor.red
        )
        let parameters = LivenessPoseDetectionParameters(detectionTimeout: 20.0)
        let livenessServiceConfiguration = LivenessServiceConfiguration(isTest: true,
                                                                        apiKey: "<put your api key here>")
        let instructions = InstructionsModel(instructionOne: "Posicione o seu rosto centralizado na área delimitada.",
                                             instructionTwo: "Mantenha uma expressão neutra.",
                                             instructionThree: "Mantenha os olhos abertos.",
                                             instructionFour: "Procure um local bem ilumidado.",
                                             instructionFive: "Retire qualquer tipo de acessório.",
                                             instructionFiveIsHidden: false)
        
        let startVC = StartViewController(instructions: instructions)
        
        startVC.startCapture = {
            let viewModel = LivenessViewModel(serviceConfig: livenessServiceConfiguration, detectionParameters: parameters)
            let livenessCameraViewController = LivenessCameraViewController(appearance: appearance,
                                                                            viewModel: viewModel)
            livenessCameraViewController.delegate = startVC
            startVC.present(livenessCameraViewController, animated: true)
        }
        
        present(startVC, animated: true)
    }
    
    @objc private func goToCaptureDocument() {
        let appearance = DocumentCameraViewControllerAppearance(
            hideCloseButton: false,
            closeButtonColor: .white,
            footerBackgroundColor: .white,
            footerCornderRadius: 6.0,
            instructionsFont: .preferredFont(forTextStyle: .headline),
            instructionsTextColor: .black,
            faceCutoutBackgroundColor: UIColor.black.withAlphaComponent(0.5),
            faceCutoutPositiveColor: .green,
            faceCutoutNegativeColor: .red,
            shouldShowRectangleObjectDetect: true,
            rectangleObjectDetectColor: .white
        )
        let parameters = DocumentDetectionParameters(detectionTimeout: 20.0)
        let documentServiceConfiguration = DocumentServiceConfiguration(isTest: true, apiKey: "<put your api key here>")
        let instructions = InstructionsModel(instructionOne: "Coloque o documento sem capa sobre uma mesa.",
                                             instructionTwo: "Procure um local bem ilumidado.",
                                             instructionThree: "Posicione o documento centralizado na área delimitada pela câmera.",
                                             instructionFour: "Mantenha o smartphone firme durante a captura e evite inclinar.",
                                             instructionFive: "",
                                             instructionFiveIsHidden: true)
        
        let startVC = StartViewController(instructions: instructions)
        
        startVC.startCapture = {
            let viewModel = DocumentViewModel(serviceConfig: documentServiceConfiguration, detectionParameters: parameters)
            let documentCameraViewController = DocumentCameraViewController(appearance: appearance,
                                                                            viewModel: viewModel)
            documentCameraViewController.delegate = startVC
            startVC.present(documentCameraViewController, animated: true)
        }
        
        present(startVC, animated: true)
    }
}

