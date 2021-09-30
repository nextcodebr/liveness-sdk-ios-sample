//
//  OtherSideDocumentViewController.swift
//  NXCDLivenessSDK_Example
//
//  Created by lucasbrito on 21/09/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit

protocol OtherSideDocumentDelegate: AnyObject {
    func captureOtherSideDocument()
    func noCaptureOtherSideDocument()
}

class OtherSideDocumentViewController: UIViewController {

    let viewContainer: UIView = {
        let viewContainer = UIView()
        viewContainer.translatesAutoresizingMaskIntoConstraints = false
        viewContainer.backgroundColor = .white

        return viewContainer
    }()

    let viewHeader: UIView = {
        let viewHeader = UIView()
        viewHeader.translatesAutoresizingMaskIntoConstraints = false

        return viewHeader
    }()

    let viewBody: UIView = {
        let viewBody = UIView()
        viewBody.translatesAutoresizingMaskIntoConstraints = false

        return viewBody
    }()

    let buttonClose: UIButton = {
        let buttonClose = UIButton()
        buttonClose.translatesAutoresizingMaskIntoConstraints = false
        buttonClose.setImage(UIImage(named: "xmark"), for: .normal)
        buttonClose.tintColor = .black

        return buttonClose
    }()

    let labelTitle: UILabel = {
        let labelTitle = UILabel()
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.textColor = .black
        labelTitle.textAlignment = .center
        labelTitle.numberOfLines = 0

        labelTitle.font = {
            if #available(iOS 11.0, *) {
                return UIFont.preferredFont(forTextStyle: .largeTitle)
            } else {
                return UIFont.preferredFont(forTextStyle: .headline)
            }
        }()

        return labelTitle
    }()

    let labelSubtitle: UILabel = {
        let labelSubtitle = UILabel()
        labelSubtitle.translatesAutoresizingMaskIntoConstraints = false
        labelSubtitle.font = .preferredFont(forTextStyle: .body)
        labelSubtitle.textColor = .black
        labelSubtitle.numberOfLines = 0

        return labelSubtitle
    }()

    let viewButtonContainer: UIView = {
        let viewButtonContainer = UIView()
        viewButtonContainer.translatesAutoresizingMaskIntoConstraints = false
        viewButtonContainer.layer.shadowColor = UIColor.black.cgColor
        viewButtonContainer.layer.shadowOpacity = 0.30
        viewButtonContainer.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        viewButtonContainer.layer.shadowRadius = 4.0

        return viewButtonContainer
    }()

    let buttonYes: UIButton = {
        let buttonYes = UIButton()
        buttonYes.translatesAutoresizingMaskIntoConstraints = false
        buttonYes.backgroundColor = .black
        buttonYes.setTitleColor(.white, for: .normal)
        buttonYes.layer.cornerRadius = 4.0

        return buttonYes
    }()
    
    let buttonNo: UIButton = {
        let buttonNo = UIButton()
        buttonNo.translatesAutoresizingMaskIntoConstraints = false
        buttonNo.backgroundColor = .black
        buttonNo.setTitleColor(.white, for: .normal)
        buttonNo.layer.cornerRadius = 4.0

        return buttonNo
    }()

    override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .darkContent
        } else {
            return .default
        }
    }

    public weak var delegate: OtherSideDocumentDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupUX()
    }

    private func setupUI() {
        view.addSubview(viewContainer)
        viewContainer.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        viewContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        viewContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        viewContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

        viewContainer.addSubview(viewBody)
        viewBody.topAnchor.constraint(equalTo: viewContainer.topAnchor).isActive = true
        viewBody.bottomAnchor.constraint(equalTo: viewContainer.bottomAnchor).isActive = true
        viewBody.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor).isActive = true
        viewBody.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor).isActive = true

        viewContainer.addSubview(viewHeader)
        viewHeader.topAnchor.constraint(equalTo: viewContainer.topAnchor).isActive = true
        viewHeader.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor).isActive = true
        viewHeader.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor).isActive = true

        viewHeader.addSubview(buttonClose)
        buttonClose.topAnchor.constraint(equalTo: viewHeader.topAnchor).isActive = true
        buttonClose.bottomAnchor.constraint(equalTo: viewHeader.bottomAnchor).isActive = true
        buttonClose.trailingAnchor.constraint(equalTo: viewHeader.trailingAnchor).isActive = true
        buttonClose.widthAnchor.constraint(equalToConstant: 56.0).isActive = true
        buttonClose.heightAnchor.constraint(equalToConstant: 56.0).isActive = true

        viewBody.addSubview(labelTitle)
        labelTitle.centerYAnchor.constraint(equalTo: viewBody.centerYAnchor, constant: -60.0).isActive = true
        labelTitle.leadingAnchor.constraint(equalTo: viewBody.leadingAnchor, constant: 40.0).isActive = true
        labelTitle.trailingAnchor.constraint(equalTo: viewBody.trailingAnchor, constant: -40.0).isActive = true
        labelTitle.text = "Tudo certo!\nContinuando..."

        viewBody.addSubview(labelSubtitle)
        labelSubtitle.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 25.0).isActive = true
        labelSubtitle.leadingAnchor.constraint(equalTo: viewBody.leadingAnchor, constant: 40.0).isActive = true
        labelSubtitle.trailingAnchor.constraint(equalTo: viewBody.trailingAnchor, constant: -40.0).isActive = true
        labelSubtitle.text = "Vamos agora capturar o outro lado do seu documento?"
        labelSubtitle.textAlignment = .center

        viewBody.addSubview(viewButtonContainer)
        viewButtonContainer.topAnchor.constraint(equalTo: labelSubtitle.bottomAnchor, constant: 40.0).isActive = true
        viewButtonContainer.centerXAnchor.constraint(equalTo: viewBody.centerXAnchor).isActive = true

        viewButtonContainer.addSubview(buttonNo)
        buttonNo.topAnchor.constraint(equalTo: viewButtonContainer.topAnchor).isActive = true
        buttonNo.bottomAnchor.constraint(equalTo: viewButtonContainer.bottomAnchor).isActive = true
        buttonNo.leadingAnchor.constraint(equalTo: viewButtonContainer.leadingAnchor).isActive = true
        buttonNo.heightAnchor.constraint(equalToConstant: 42.0).isActive = true
        buttonNo.widthAnchor.constraint(equalToConstant: 72.0).isActive = true
        buttonNo.setTitle("NÃO", for: .normal)
        
        viewButtonContainer.addSubview(buttonYes)
        buttonYes.topAnchor.constraint(equalTo: viewButtonContainer.topAnchor).isActive = true
        buttonYes.leadingAnchor.constraint(equalTo: buttonNo.trailingAnchor, constant: 16.0).isActive = true
        buttonYes.bottomAnchor.constraint(equalTo: viewButtonContainer.bottomAnchor).isActive = true
        buttonYes.trailingAnchor.constraint(equalTo: viewButtonContainer.trailingAnchor).isActive = true
        buttonYes.heightAnchor.constraint(equalToConstant: 42.0).isActive = true
        buttonYes.widthAnchor.constraint(equalToConstant: 72.0).isActive = true
        buttonYes.setTitle("SIM", for: .normal)
    }

    private func setupUX() {
        buttonClose.addTarget(self, action: #selector(actionClose), for: .touchUpInside)
        buttonYes.addTarget(self, action: #selector(actionYesButton), for: .touchUpInside)
        buttonNo.addTarget(self, action: #selector(actionNoButton), for: .touchUpInside)
    }

    @objc private func actionClose() {
        dismiss(animated: true)
    }

    @objc private func actionYesButton() {
        delegate?.captureOtherSideDocument()
    }
    
    @objc private func actionNoButton() {
        delegate?.noCaptureOtherSideDocument()
    }

}
