//
//  SuccessViewController.swift
//  nxcd-liveness-example
//
//  Created by Spencer Müller Diniz on 13/04/21.
//

import UIKit

import UIKit

protocol SuccessViewControllerDelegate: AnyObject {
    func successViewControllerMainAction()
}

struct SuccessOCRModel {
    let isDocumentDetected: Bool
    var name: String? = "---"
    var motherName: String? = "---"
    var cpf: String? = "---"
    var birthday: String? = "---"
    
    init(isDocumentDetected: Bool, json: [String: Any]) {
        self.isDocumentDetected = isDocumentDetected
        
        if let data = json["data"] as? [[String: Any]],
              let firstData = data.first,
              let extraction = firstData["extraction"] as? [String: Any] {
        
            name = extraction["name"] as? String
            cpf = extraction["federalRevenueNumber"] as? String
            motherName = extraction["mothersName"] as? String
            birthday = extraction["birthdate"] as? String
        }
    }
    
    init(isDocumentDetected: Bool) {
        self.isDocumentDetected = isDocumentDetected
    }
}

class SuccessViewController: UIViewController {
    
    // MARK: - Views
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
    
    let stackViewBody: UIStackView = {
        let stackViewBody = UIStackView()
        stackViewBody.axis = .vertical
        stackViewBody.alignment = .fill
        stackViewBody.distribution = .fillEqually
        stackViewBody.spacing = 16.0
        stackViewBody.translatesAutoresizingMaskIntoConstraints = false
        return stackViewBody
    }()
    
    let stackViewName: UIStackView = {
        let stackViewName = UIStackView()
        stackViewName.axis = .vertical
        stackViewName.alignment = .fill
        stackViewName.distribution = .fill
        stackViewName.translatesAutoresizingMaskIntoConstraints = false
        return stackViewName
    }()
    
    
    let labelName: UILabel = {
        let labelName = UILabel()
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelName.font = UIFont.systemFont(ofSize: kTextSize, weight: .semibold)
        labelName.textColor = .black
        labelName.text = "Nome"
        return labelName
    }()
    
    let labelUserName: UILabel = {
        let labelUserName = UILabel()
        labelUserName.translatesAutoresizingMaskIntoConstraints = false
        labelUserName.font = UIFont.systemFont(ofSize: kTextSize, weight: .regular)
        labelUserName.textColor = .black
        labelUserName.numberOfLines = 0
        return labelUserName
    }()
    
    let stackViewMotherName: UIStackView = {
        let stackViewMotherName = UIStackView()
        stackViewMotherName.axis = .vertical
        stackViewMotherName.alignment = .fill
        stackViewMotherName.distribution = .fill
        stackViewMotherName.translatesAutoresizingMaskIntoConstraints = false
        return stackViewMotherName
    }()
    
    
    let labelMotherName: UILabel = {
        let labelMotherName = UILabel()
        labelMotherName.translatesAutoresizingMaskIntoConstraints = false
        labelMotherName.font = UIFont.systemFont(ofSize: kTextSize, weight: .semibold)
        labelMotherName.textColor = .black
        labelMotherName.text = "Nome da mãe"
        return labelMotherName
    }()
    
    let labelMotherUserName: UILabel = {
        let labelMotherUserName = UILabel()
        labelMotherUserName.translatesAutoresizingMaskIntoConstraints = false
        labelMotherUserName.font = UIFont.systemFont(ofSize: kTextSize, weight: .regular)
        labelMotherUserName.textColor = .black
        labelMotherUserName.numberOfLines = 0
        return labelMotherUserName
    }()
    
    let stackViewCPF: UIStackView = {
        let stackViewCPF = UIStackView()
        stackViewCPF.axis = .vertical
        stackViewCPF.alignment = .fill
        stackViewCPF.distribution = .fill
        stackViewCPF.translatesAutoresizingMaskIntoConstraints = false
        return stackViewCPF
    }()
    
    
    let labelCPF: UILabel = {
        let labelCPF = UILabel()
        labelCPF.translatesAutoresizingMaskIntoConstraints = false
        labelCPF.font = UIFont.systemFont(ofSize: kTextSize, weight: .semibold)
        labelCPF.textColor = .black
        labelCPF.text = "CPF"
        return labelCPF
    }()
    
    let labelUserCPF: UILabel = {
        let labelUserCPF = UILabel()
        labelUserCPF.translatesAutoresizingMaskIntoConstraints = false
        labelUserCPF.font = UIFont.systemFont(ofSize: kTextSize, weight: .regular)
        labelUserCPF.textColor = .black
        return labelUserCPF
    }()
    
    let stackViewBirthday: UIStackView = {
        let stackViewBirthday = UIStackView()
        stackViewBirthday.axis = .vertical
        stackViewBirthday.alignment = .fill
        stackViewBirthday.distribution = .fill
        stackViewBirthday.translatesAutoresizingMaskIntoConstraints = false
        return stackViewBirthday
    }()
    
    
    let labelBirthday: UILabel = {
        let labelBirthday = UILabel()
        labelBirthday.translatesAutoresizingMaskIntoConstraints = false
        labelBirthday.font = UIFont.systemFont(ofSize: kTextSize, weight: .semibold)
        labelBirthday.textColor = .black
        labelBirthday.text = "Data de nascimento"
        return labelBirthday
    }()
    
    let labelUserBirthday: UILabel = {
        let labelUserBirthday = UILabel()
        labelUserBirthday.translatesAutoresizingMaskIntoConstraints = false
        labelUserBirthday.font = UIFont.systemFont(ofSize: kTextSize, weight: .regular)
        labelUserBirthday.textColor = .black
        return labelUserBirthday
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
        viewButtonContainer.layer.shadowPath = UIBezierPath(rect: viewButtonContainer.bounds).cgPath

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

    override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .darkContent
        } else {
            return .default
        }
    }
    
    // MARK: - Variables
    public weak var delegate: SuccessViewControllerDelegate?
    private let model: SuccessOCRModel
    private static let kTextSize: CGFloat = 18
    
    //MARK: - Initialization
    init(model: SuccessOCRModel) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupUX()
    }
    
    // MARK: - Setups
    private func setupUI() {
        setupContainerView()
        setupBodyView()
        setupHeaderView()
        setupCloseButton()
        setupImageIcon()
        setupTitleLabel()
        setupBodyStackView()
        
        if model.isDocumentDetected {
            setupNameStackView()
            setupMotherNameStackView()
            setupCPFStackView()
            setupBirthdayStackView()
        } else {
            setupSubtitleLabel()
        }
        
        setupContainerButton()
    }
    
    private func setupContainerView() {
        view.addSubview(viewContainer)
        viewContainer.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        viewContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        viewContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        viewContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    private func setupBodyView() {
        viewContainer.addSubview(viewBody)
        viewBody.topAnchor.constraint(equalTo: viewContainer.topAnchor).isActive = true
        viewBody.bottomAnchor.constraint(equalTo: viewContainer.bottomAnchor).isActive = true
        viewBody.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor).isActive = true
        viewBody.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor).isActive = true
    }
    
    private func setupHeaderView() {
        viewContainer.addSubview(viewHeader)
        viewHeader.topAnchor.constraint(equalTo: viewContainer.topAnchor).isActive = true
        viewHeader.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor).isActive = true
        viewHeader.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor).isActive = true
    }
    
    private func setupCloseButton() {
        viewHeader.addSubview(buttonClose)
        buttonClose.topAnchor.constraint(equalTo: viewHeader.topAnchor).isActive = true
        buttonClose.bottomAnchor.constraint(equalTo: viewHeader.bottomAnchor).isActive = true
        buttonClose.trailingAnchor.constraint(equalTo: viewHeader.trailingAnchor).isActive = true
        buttonClose.widthAnchor.constraint(equalToConstant: 56.0).isActive = true
        buttonClose.heightAnchor.constraint(equalToConstant: 56.0).isActive = true
    }
    
    private func setupImageIcon() {
        viewBody.addSubview(imageViewIcon)
        imageViewIcon.topAnchor.constraint(equalTo: viewBody.topAnchor, constant: 111.0).isActive = true
        imageViewIcon.centerXAnchor.constraint(equalTo: viewBody.centerXAnchor).isActive = true
    }
    
    private func setupTitleLabel() {
        viewBody.addSubview(labelTitle)
        labelTitle.topAnchor.constraint(equalTo: imageViewIcon.bottomAnchor, constant: 52.0).isActive = true
        labelTitle.leadingAnchor.constraint(equalTo: viewBody.leadingAnchor, constant: 40.0).isActive = true
        labelTitle.trailingAnchor.constraint(equalTo: viewBody.trailingAnchor, constant: -40.0).isActive = true
        labelTitle.text = model.isDocumentDetected ? "Dados obtidos\ncom sucesso" : "Verificação concluída\ncom sucesso"
    }
    
    private func setupBodyStackView() {
        viewBody.addSubview(stackViewBody)
        stackViewBody.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 24.0).isActive = true
        stackViewBody.leadingAnchor.constraint(equalTo: viewBody.leadingAnchor, constant: 65.0).isActive = true
        stackViewBody.trailingAnchor.constraint(equalTo: viewBody.trailingAnchor, constant: -65.0).isActive = true
    }
    
    private func setupSubtitleLabel() {
        stackViewBody.addArrangedSubview(labelSubtitle)
        labelSubtitle.leadingAnchor.constraint(equalTo: stackViewBody.leadingAnchor).isActive = true
        labelSubtitle.trailingAnchor.constraint(equalTo: stackViewBody.trailingAnchor).isActive = true
        labelSubtitle.text = "Parabéns, sua verificação facial foi concluída com sucesso!"
    }
    
    private func setupNameStackView() {
        stackViewBody.addArrangedSubview(stackViewName)
        stackViewName.leadingAnchor.constraint(equalTo: stackViewBody.leadingAnchor).isActive = true
        stackViewName.trailingAnchor.constraint(equalTo: stackViewBody.trailingAnchor).isActive = true
        
        stackViewName.addArrangedSubview(labelName)
        labelName.leadingAnchor.constraint(equalTo: stackViewName.leadingAnchor).isActive = true
        labelName.trailingAnchor.constraint(equalTo: stackViewName.trailingAnchor).isActive = true
        labelName.heightAnchor.constraint(equalToConstant: 16.0).isActive = true
        
        stackViewName.addArrangedSubview(labelUserName)
        labelUserName.leadingAnchor.constraint(equalTo: stackViewName.leadingAnchor).isActive = true
        labelUserName.trailingAnchor.constraint(equalTo: stackViewName.trailingAnchor).isActive = true
        labelUserName.text = model.name
    }
    
    private func setupMotherNameStackView() {
        stackViewBody.addArrangedSubview(stackViewMotherName)
        stackViewMotherName.leadingAnchor.constraint(equalTo: stackViewBody.leadingAnchor).isActive = true
        stackViewMotherName.trailingAnchor.constraint(equalTo: stackViewBody.trailingAnchor).isActive = true
        
        stackViewMotherName.addArrangedSubview(labelMotherName)
        labelMotherName.leadingAnchor.constraint(equalTo: stackViewMotherName.leadingAnchor).isActive = true
        labelMotherName.trailingAnchor.constraint(equalTo: stackViewMotherName.trailingAnchor).isActive = true
        labelMotherName.heightAnchor.constraint(equalToConstant: 16.0).isActive = true
        
        stackViewMotherName.addArrangedSubview(labelMotherUserName)
        labelMotherUserName.leadingAnchor.constraint(equalTo: stackViewMotherName.leadingAnchor).isActive = true
        labelMotherUserName.trailingAnchor.constraint(equalTo: stackViewMotherName.trailingAnchor).isActive = true
        labelMotherUserName.text = model.motherName
    }
    
    private func setupCPFStackView() {
        stackViewBody.addArrangedSubview(stackViewCPF)
        stackViewCPF.leadingAnchor.constraint(equalTo: stackViewBody.leadingAnchor).isActive = true
        stackViewCPF.trailingAnchor.constraint(equalTo: stackViewBody.trailingAnchor).isActive = true
        
        stackViewCPF.addArrangedSubview(labelCPF)
        labelCPF.leadingAnchor.constraint(equalTo: stackViewCPF.leadingAnchor).isActive = true
        labelCPF.trailingAnchor.constraint(equalTo: stackViewCPF.trailingAnchor).isActive = true
        labelCPF.heightAnchor.constraint(equalToConstant: 16.0).isActive = true
        
        stackViewCPF.addArrangedSubview(labelUserCPF)
        labelUserCPF.leadingAnchor.constraint(equalTo: stackViewCPF.leadingAnchor).isActive = true
        labelUserCPF.trailingAnchor.constraint(equalTo: stackViewCPF.trailingAnchor).isActive = true
        labelUserCPF.text = model.cpf
    }
    
    private func setupBirthdayStackView() {
        stackViewBody.addArrangedSubview(stackViewBirthday)
        stackViewBirthday.leadingAnchor.constraint(equalTo: stackViewBody.leadingAnchor).isActive = true
        stackViewBirthday.trailingAnchor.constraint(equalTo: stackViewBody.trailingAnchor).isActive = true
        
        stackViewBirthday.addArrangedSubview(labelBirthday)
        labelBirthday.leadingAnchor.constraint(equalTo: stackViewBirthday.leadingAnchor).isActive = true
        labelBirthday.trailingAnchor.constraint(equalTo: stackViewBirthday.trailingAnchor).isActive = true
        labelBirthday.heightAnchor.constraint(equalToConstant: 16.0).isActive = true
        
        stackViewBirthday.addArrangedSubview(labelUserBirthday)
        labelUserBirthday.leadingAnchor.constraint(equalTo: stackViewBirthday.leadingAnchor).isActive = true
        labelUserBirthday.trailingAnchor.constraint(equalTo: stackViewBirthday.trailingAnchor).isActive = true
        labelUserBirthday.text = model.birthday
    }
    
    private func setupContainerButton() {
        viewBody.addSubview(viewButtonContainer)
        viewButtonContainer.topAnchor.constraint(greaterThanOrEqualTo: stackViewBody.bottomAnchor, constant: 40.0).isActive = true
        viewButtonContainer.bottomAnchor.constraint(equalTo: viewBody.bottomAnchor, constant: -80.0).isActive = true
        viewButtonContainer.centerXAnchor.constraint(equalTo: viewBody.centerXAnchor).isActive = true

        viewButtonContainer.addSubview(buttonMain)
        buttonMain.topAnchor.constraint(equalTo: viewButtonContainer.topAnchor).isActive = true
        buttonMain.bottomAnchor.constraint(equalTo: viewButtonContainer.bottomAnchor).isActive = true
        buttonMain.leadingAnchor.constraint(equalTo: viewButtonContainer.leadingAnchor).isActive = true
        buttonMain.trailingAnchor.constraint(equalTo: viewButtonContainer.trailingAnchor).isActive = true
        buttonMain.heightAnchor.constraint(equalToConstant: 42.0).isActive = true
        buttonMain.widthAnchor.constraint(equalToConstant: 132.0).isActive = true
        buttonMain.setTitle("CONTINUAR", for: .normal)
    }

    private func setupUX() {
        buttonClose.addTarget(self, action: #selector(actionClose), for: .touchUpInside)
        buttonMain.addTarget(self, action: #selector(actionMain), for: .touchUpInside)
    }
    
    // MARK: - Functions
    @objc private func actionClose() {
        dismiss(animated: true)
    }

    @objc private func actionMain() {
        delegate?.successViewControllerMainAction()
    }
}
