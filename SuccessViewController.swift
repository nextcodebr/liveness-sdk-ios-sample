//
//  SuccessViewController.swift
//  nxcd-liveness-example
//
//  Created by Spencer Müller Diniz on 13/04/21.
//

import UIKit

protocol SuccessViewControllerDelegate: class {
    func successViewControllerMainAction()
}

class SuccessViewController: UIViewController {
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

    let imageViewIcon: UIImageView = {
        let imageViewIcon = UIImageView(image: UIImage(named: "check-circle-outline"))
        imageViewIcon.tintColor = .green
        imageViewIcon.translatesAutoresizingMaskIntoConstraints = false
        imageViewIcon.widthAnchor.constraint(equalToConstant: 111.0).isActive = true
        imageViewIcon.heightAnchor.constraint(equalToConstant: 111.0).isActive = true

        return imageViewIcon
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

    let buttonMain: UIButton = {
        let buttonAction = UIButton()
        buttonAction.translatesAutoresizingMaskIntoConstraints = false
        buttonAction.backgroundColor = .black
        buttonAction.setTitleColor(.white, for: .normal)
        buttonAction.layer.cornerRadius = 4.0

        return buttonAction
    }()

    public weak var delegate: SuccessViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupUI()
        self.setupUX()
    }

    private func setupUI() {
        self.view.addSubview(self.viewContainer)
        self.viewContainer.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.viewContainer.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.viewContainer.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.viewContainer.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true

        self.viewContainer.addSubview(self.viewBody)
        self.viewBody.topAnchor.constraint(equalTo: self.viewContainer.topAnchor).isActive = true
        self.viewBody.bottomAnchor.constraint(equalTo: self.viewContainer.bottomAnchor).isActive = true
        self.viewBody.leadingAnchor.constraint(equalTo: self.viewContainer.leadingAnchor).isActive = true
        self.viewBody.trailingAnchor.constraint(equalTo: self.viewContainer.trailingAnchor).isActive = true

        self.viewContainer.addSubview(self.viewHeader)
        self.viewHeader.topAnchor.constraint(equalTo: self.viewContainer.topAnchor).isActive = true
        self.viewHeader.leadingAnchor.constraint(equalTo: self.viewContainer.leadingAnchor).isActive = true
        self.viewHeader.trailingAnchor.constraint(equalTo: self.viewContainer.trailingAnchor).isActive = true

        self.viewHeader.addSubview(self.buttonClose)
        self.buttonClose.topAnchor.constraint(equalTo: self.viewHeader.topAnchor).isActive = true
        self.buttonClose.bottomAnchor.constraint(equalTo: self.viewHeader.bottomAnchor).isActive = true
        self.buttonClose.trailingAnchor.constraint(equalTo: self.viewHeader.trailingAnchor).isActive = true
        self.buttonClose.widthAnchor.constraint(equalToConstant: 56.0).isActive = true
        self.buttonClose.heightAnchor.constraint(equalToConstant: 56.0).isActive = true

        self.viewBody.addSubview(self.imageViewIcon)
        self.imageViewIcon.topAnchor.constraint(equalTo: self.viewBody.topAnchor, constant: 111.0).isActive = true
        self.imageViewIcon.centerXAnchor.constraint(equalTo: self.viewBody.centerXAnchor).isActive = true

        self.viewBody.addSubview(self.labelTitle)
        self.labelTitle.topAnchor.constraint(equalTo: self.imageViewIcon.bottomAnchor, constant: 58.0).isActive = true
        self.labelTitle.leadingAnchor.constraint(equalTo: self.viewBody.leadingAnchor, constant: 40.0).isActive = true
        self.labelTitle.trailingAnchor.constraint(equalTo: self.viewBody.trailingAnchor, constant: -40.0).isActive = true
        self.labelTitle.text = "Verificação concluída\ncom sucesso"

        self.viewBody.addSubview(self.labelSubtitle)
        self.labelSubtitle.topAnchor.constraint(equalTo: self.labelTitle.bottomAnchor, constant: 25.0).isActive = true
        self.labelSubtitle.leadingAnchor.constraint(equalTo: self.viewBody.leadingAnchor, constant: 40.0).isActive = true
        self.labelSubtitle.trailingAnchor.constraint(equalTo: self.viewBody.trailingAnchor, constant: -40.0).isActive = true
        self.labelSubtitle.text = "Parabéns, sua verificação facial foi concluída com sucesso!"

        self.viewBody.addSubview(self.viewButtonContainer)
        self.viewButtonContainer.topAnchor.constraint(equalTo: self.labelSubtitle.bottomAnchor, constant: 40.0).isActive = true
        self.viewButtonContainer.centerXAnchor.constraint(equalTo: self.viewBody.centerXAnchor).isActive = true

        self.viewButtonContainer.addSubview(self.buttonMain)
        self.buttonMain.topAnchor.constraint(equalTo: self.viewButtonContainer.topAnchor).isActive = true
        self.buttonMain.bottomAnchor.constraint(equalTo: self.viewButtonContainer.bottomAnchor).isActive = true
        self.buttonMain.leadingAnchor.constraint(equalTo: self.viewButtonContainer.leadingAnchor).isActive = true
        self.buttonMain.trailingAnchor.constraint(equalTo: self.viewButtonContainer.trailingAnchor).isActive = true
        self.buttonMain.heightAnchor.constraint(equalToConstant: 42.0).isActive = true
        self.buttonMain.widthAnchor.constraint(equalToConstant: 132.0).isActive = true
        self.buttonMain.setTitle("CONTINUAR", for: .normal)
    }

    private func setupUX() {
        self.buttonClose.addTarget(self, action: #selector(self.actionClose), for: .touchUpInside)
        self.buttonMain.addTarget(self, action: #selector(self.actionMain), for: .touchUpInside)
    }

    @objc private func actionClose() {
        self.dismiss(animated: true)
    }

    @objc private func actionMain() {
        self.delegate?.successViewControllerMainAction()
    }
}
