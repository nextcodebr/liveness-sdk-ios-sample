# NXCDLivenessSDK
## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

NXCDLivenessSDK is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'NXCDLivenessSDK'
```

## Using NXCDLivenessSDK

Implement `LivenessCameraViewControllerDelegate` protocol to handle SDK events:

```swift
extension StartViewController: LivenessCameraViewControllerDelegate {
    func completedLivenessProcessing(livenessResult: LivenessResult?) {
        self.dismiss(animated: true) {
            if let livenessResult = livenessResult {
                if livenessResult.isAlive {
                    let successViewController = SuccessViewController()
                    successViewController.delegate = self

                    self.present(successViewController, animated: true)
                }
                else {
                    let failureViewController = FailureViewController()
                    failureViewController.delegate = self

                    self.present(failureViewController, animated: true)
                }
            }
            else {
                let alertController = UIAlertController(title: "Ooops!", message: "Desculpe o transtorno, mas ocorreu um erro. Por favor, tente novamente.", preferredStyle: .alert)

                let alertAction = UIAlertAction(title: "OK", style: .default) { (_) in
                    alertController.dismiss(animated: true)
                }

                alertController.addAction(alertAction)

                self.present(alertController, animated: true)
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

Use `LivenessServiceConfiguration` to pass API Key and configure SDK for testing or production mode:

```swift
let livenessServiceConfiguration = LivenessServiceConfiguration(isTest: false, apiKey: "<put your api key here>")
```

Create an instance of `LivenessCameraViewController` and present it:

```swift
let livenessCameraViewController = LivenessCameraViewController(livenessServiceConfiguration: livenessServiceConfiguration, appearance: appearance)
livenessCameraViewController.delegate = self
self.present(livenessCameraViewController, animated: true)
```

## Author

Spencer Müller Diniz, spencer.diniz@rarolabs.com.br

## License

NXCDLivenessSDK is available under the MIT license. See the LICENSE file for more info.
