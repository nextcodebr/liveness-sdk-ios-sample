# NXCDLivenessSDK
## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

NXCDLivenessSDK is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'NXCDLivenessSDK', :git => 'https://github.com/nextcodebr/liveness-sdk-podspec-ios.git'
```

## Using NXCDLivenessSDK

## 1. Face Detection 

Implement `LivenessCameraViewControllerDelegate` protocol to handle SDK events:

```swift
extension StartViewController: LivenessCameraViewControllerDelegate {
    func completedLivenessProcessing(result: Result<[String: Any], SDKError>, image: UIImage?) {
        self.dismiss(animated: true) {
            switch result {
            case .success(let livenessResult):
                if let data = livenessResult["data"] as? [String: Any],
                    let isAlive = data["isAlive"] as? Bool {
                        if isAlive {
                            self.goToSuccessViewController(model: SuccessOCRModel(isDocumentDetected: false))
                        }
                        else {
                            let failureViewController = FailureViewController()
                            failureViewController.delegate = self
                            
                            self.present(failureViewController, animated: true)
                        }
                } else {
                    self.showAlertError()
                }
            case .failure(let error):
                print(error)
                self.showAlertError()
            }
        }
    }
    }
}
```

Use  `LivenessCameraViewControllerAppearance` to customize layout:

```swift
let appearance = LivenessCameraViewControllerAppearance(
    hideCloseButton: false,
    closeButtonColor: .white,
    footerBackgroundColor: .clear,
    footerCornderRadius: 6.0,
    instructionsFont: .preferredFont(forTextStyle: .headline),
    instructionsTextColor: .white,
    faceCutoutBackgroundColor: UIColor.black.withAlphaComponent(0.5),
    faceCutoutPositiveColor: UIColor.green,
    faceCutoutNegativeColor: UIColor.red
)
```

Use `LivenessPoseDetectionParameters` to pass the detection timeout:

```swift
let parameters = LivenessPoseDetectionParameters(detectionTimeout: 20.0)
```

Use `LivenessServiceConfiguration` to pass API Key and configure SDK for testing or production mode:

```swift
let livenessServiceConfiguration = LivenessServiceConfiguration(isTest: false, apiKey: "<put your api key here>")
```

If you want to customize the capture instructions, use `LivenessInstructionsModel` to pass the messages:

```swift
let livenessInstructions = LivenessInstructionsModel(
    moreThanOnePerson: "Mais de uma pessoa detectada",
    keepYourEyesOpen: "Mantenha os olhos abertos",
    keepNaturalExpression: "Mantenha uma expressão neutra",
    turnLeft: "Vire para a esquerda",
    turnRight: "Vire para a direita",
    lowerYourHead: "Abaixe a cabeça",
    liftYourHead: "Levante a cabeça",
    bringFaceCloser: "Aproxime o rosto",
    moveFaceAway: "Afaste o rosto",
    centerTheFace: "Centralize o rosto",
    processing: "Processando"
)
```

Create an instance of `LivenessCameraViewController` through the static method 'start' of the 'Liveness' class and present it:

```swift
// IF YOU CREATE A LIVENESS INSTRUCTIONS
let livenessVC = Liveness.start(serviceConfig: livenessServiceConfiguration, 
                                detectionParameters: parameters, 
                                livenessInstructions: livenessInstructions)

// ELSE, THE DEFAULT WILL BE USED
let livenessVC = Liveness.start(serviceConfig: livenessServiceConfiguration, delegate: startVC)
            
startVC.present(livenessCameraViewController, animated: true)
```
---

## 2. Document Detection

Implement `DocumentCameraViewControllerDelegate` protocol to handle SDK events:

```swift
extension StartViewController: DocumentCameraViewControllerDelegate {
    func completedDocumentProcessing(documentResult: Result<[String: Any], SDKError>, image: UIImage?) {
        dismiss(animated: true) {
            switch documentResult {
            case .success(let result):
                if let data = result["data"] as? [[String: Any]] {
                    print(data)
                }
                
                guard let image = image else { return }
                self.imageArray.append(image)
                
                let otherSide = OtherSideDocumentViewController()
                otherSide.delegate = self
                
                self.present(otherSide, animated: true)
                
            case .failure(let error):
                print(error)
                self.showAlertError()
            }
        }
    }
}
```

Use  `DocumentCameraViewControllerAppearance` to customize layout:

```swift
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
```

Use `DocumentServiceConfiguration` to pass API Key and configure SDK for testing or production mode:

```swift
let documentServiceConfiguration = DocumentServiceConfiguration(isTest: false, apiKey: "<put your api key here>")
```

Use `DocumentDetectionParameters` to pass the detection timeout:

```swift
let parameters = DocumentDetectionParameters(detectionTimeout: 20.0)
```

If you want to customize the capture instructions, use `DocumentInstructionsModel` to pass the messages:

```swift
let documentInstructions = DocumentInstructionsModel(
    phoneParallelToDocument: "Colocar telefone paralelo ao documento",
    bringCameraCloser: "Aproxime a câmera",
    moveCameraAway: "Afaste a câmera",
    centerTheDocument: "Centralize o documento",
    processing: "Processando"
)
```

Create an instance of `DocumentCameraViewController` through the static method 'start' of the Document class and present it:

```swift
// IF YOU CREATE A DOCUMENT INSTRUCTIONS
let documentCameraViewController = Document.start(serviceConfig: documentServiceConfiguration, 
                                detectionParameters: parameters,
                                documentInstructions: documentInstructions)

// ELSE, THE DEFAULT WILL BE USED
let documentCameraViewController = Document.start(serviceConfig: documentServiceConfiguration,
                                                              delegate: startVC)

startVC.present(documentCameraViewController, animated: true)
```

## Author

Spencer Müller Diniz, spencer.diniz@rarolabs.com.br

Lucas Santana Brito, lucas.brito@rarolabs.com.br

## License

NXCDLivenessSDK is available under the MIT license. See the LICENSE file for more info.