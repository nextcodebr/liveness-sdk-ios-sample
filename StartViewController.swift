//
//  StartViewController.swift
//  nxcd-liveness-example
//
//  Created by Spencer Müller Diniz on 04/04/21.
//

import UIKit
import NXCDLivenessSDK

class StartViewController: UIViewController {
    @IBOutlet weak var viewButtonContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupUI()
    }

    private func setupUI() {
        self.view.backgroundColor = .white

        self.viewButtonContainer.translatesAutoresizingMaskIntoConstraints = false
        self.viewButtonContainer.layer.shadowColor = UIColor.black.cgColor
        self.viewButtonContainer.layer.shadowOpacity = 0.30
        self.viewButtonContainer.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.viewButtonContainer.layer.shadowRadius = 4.0
    }

    @IBAction private func actionStartDemo(_ sender: UIButton) {
        self.startDemo()
    }

    private func startDemo() {
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

        let livenessServiceConfiguration = LivenessServiceConfiguration(isTest: false, apiKey: "<put your api key here>")
        let livenessCameraViewController = LivenessCameraViewController(livenessServiceConfiguration: livenessServiceConfiguration, appearance: appearance)
        livenessCameraViewController.delegate = self
        self.present(livenessCameraViewController, animated: true)
    }
}

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

extension StartViewController: SuccessViewControllerDelegate {
    func successViewControllerMainAction() {
        self.dismiss(animated: true)
    }
}

extension StartViewController: FailureViewControllerDelegate {
    func failureViewControllerMainAction() {
        self.dismiss(animated: true) {
            self.startDemo()
        }
    }
}
