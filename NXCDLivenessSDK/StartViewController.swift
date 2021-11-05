//
//  StartViewController.swift
//  nxcd-liveness-example
//
//  Created by Spencer Müller Diniz on 04/04/21.
//

import UIKit
import NXCDLivenessSDK

class StartViewController: UIViewController {
    //MARK: - Constants
    private static let kInstructionTextSize: CGFloat = 18.0
    private static let kInstructionNumberSize: CGFloat = 14.0
    
    //MARK:- Views
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let bodyView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "xmark"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Instruções"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 32.0, weight: .bold)
        label.textAlignment = .natural
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let instructionsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8.0
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let instructionOneView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let instructionOneTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: kInstructionTextSize, weight: .regular)
        label.textAlignment = .natural
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let instructionOneNumberView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.38)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let instructionOneNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: kInstructionNumberSize, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let instructionTwoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let instructionTwoTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: kInstructionTextSize, weight: .regular)
        label.textAlignment = .natural
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let instructionTwoNumberView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.38)
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let instructionTwoNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "2"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: kInstructionNumberSize, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let instructionThreeView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let instructionThreeTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: kInstructionTextSize, weight: .regular)
        label.textAlignment = .natural
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let instructionThreeNumberView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.38)
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let instructionThreeNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "3"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: kInstructionNumberSize, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let instructionFourView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let instructionFourTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: kInstructionTextSize, weight: .regular)
        label.textAlignment = .natural
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let instructionFourNumberView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.38)
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let instructionFourNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "4"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: kInstructionNumberSize, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let instructionFiveView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let instructionFiveTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: kInstructionTextSize, weight: .regular)
        label.textAlignment = .natural
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let instructionFiveNumberView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.38)
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let instructionFiveNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "5"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: kInstructionNumberSize, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let letsGoButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("OK, VAMOS LÁ", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4.0
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        button.layer.shadowPath = UIBezierPath(rect: button.bounds).cgPath
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let viewActivityOverlay: UIView = {
        let viewActivityOverlay = UIView()
        viewActivityOverlay.translatesAutoresizingMaskIntoConstraints = false
        viewActivityOverlay.isHidden = true
        viewActivityOverlay.backgroundColor = UIColor.black.withAlphaComponent(0.5)

        return viewActivityOverlay
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator: UIActivityIndicatorView = {
            if #available(iOS 13.0, *) {
                return UIActivityIndicatorView(style: .large)
            } else {
                return UIActivityIndicatorView(style: .whiteLarge)
            }
        }()

        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.color = .white
        
        return activityIndicator
    }()
    
    //MARK: - Variables
    private let instructions: InstructionsModel
    private var imageArray = [UIImage]()
    
    private let service = Service(isTest: true, apiKey: "<put your api key here>")
    var startCapture: (() -> Void)?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .darkContent
        } else {
            return .default
        }
    }
    
    //MARK: - Initialization
    init(instructions: InstructionsModel) {
        self.instructions = instructions
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupUX()
    }
    
    override func viewDidLayoutSubviews() {
        instructionOneNumberView.layer.cornerRadius = instructionOneNumberView.frame.size.width / 2.0
        instructionOneNumberView.clipsToBounds = true
        
        instructionTwoNumberView.layer.cornerRadius = instructionTwoNumberView.frame.size.width / 2.0
        instructionTwoNumberView.clipsToBounds = true
        
        instructionThreeNumberView.layer.cornerRadius = instructionThreeNumberView.frame.size.width / 2.0
        instructionThreeNumberView.clipsToBounds = true
        
        instructionFourNumberView.layer.cornerRadius = instructionFourNumberView.frame.size.width / 2.0
        instructionFourNumberView.clipsToBounds = true
        
        instructionFiveNumberView.layer.cornerRadius = instructionFiveNumberView.frame.size.width / 2.0
        instructionFiveNumberView.clipsToBounds = true
    }
    
    //MARK: - Setups
    private func setupUI() {
        setupContainerView()
        setupHeaderView()
        setupCloseButton()
        setupBodyView()
        setupTitleLabel()
        setupInstructionsStackView()
        setupInstructionOne()
        setupInstructionTwo()
        setupInstructionThree()
        setupInstructionFour()
        setupInstructionFive()
        setupLetsGoButton()
        setupActivityOverlayView()
    }
    
    private func setupContainerView() {
        view.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    private func setupHeaderView() {
        containerView.addSubview(headerView)
        headerView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        headerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
    }
    
    private func setupCloseButton() {
        headerView.addSubview(closeButton)
        closeButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 21.2).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -21.2).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 56.0).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 56.0).isActive = true
    }
    
    private func setupBodyView() {
        containerView.addSubview(bodyView)
        bodyView.topAnchor.constraint(equalTo: closeButton.bottomAnchor).isActive = true
        bodyView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        bodyView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        bodyView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
    }
    
    private func setupTitleLabel() {
        bodyView.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: bodyView.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: bodyView.leadingAnchor, constant: 48.0).isActive = true
    }
    
    private func setupInstructionsStackView() {
        bodyView.addSubview(instructionsStackView)
        instructionsStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50).isActive = true
        instructionsStackView.leadingAnchor.constraint(equalTo: bodyView.leadingAnchor, constant: 48.0).isActive = true
        instructionsStackView.trailingAnchor.constraint(equalTo: bodyView.trailingAnchor, constant: -48.0).isActive = true
    }
    
    private func setupInstructionOne() {
        instructionsStackView.addArrangedSubview(instructionOneView)
        instructionOneView.leadingAnchor.constraint(equalTo: instructionsStackView.leadingAnchor).isActive = true
        instructionOneView.trailingAnchor.constraint(equalTo: instructionsStackView.trailingAnchor).isActive = true
        instructionOneView.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
        
        instructionOneView.addSubview(instructionOneNumberView)
        instructionOneNumberView.centerYAnchor.constraint(equalTo: instructionOneView.centerYAnchor).isActive = true
        instructionOneNumberView.leadingAnchor.constraint(equalTo: instructionOneView.leadingAnchor).isActive = true
        instructionOneNumberView.heightAnchor.constraint(equalToConstant: 24.0).isActive = true
        instructionOneNumberView.widthAnchor.constraint(equalToConstant: 24.0).isActive = true
        
        
        instructionOneNumberView.addSubview(instructionOneNumberLabel)
        instructionOneNumberLabel.centerXAnchor.constraint(equalTo: instructionOneNumberView.centerXAnchor).isActive = true
        instructionOneNumberLabel.centerYAnchor.constraint(equalTo: instructionOneNumberView.centerYAnchor).isActive = true
        
        instructionOneView.addSubview(instructionOneTitleLabel)
        instructionOneTitleLabel.centerYAnchor.constraint(equalTo: instructionOneView.centerYAnchor).isActive = true
        instructionOneTitleLabel.leadingAnchor.constraint(equalTo: instructionOneNumberView.trailingAnchor, constant: 8.0).isActive = true
        instructionOneTitleLabel.trailingAnchor.constraint(equalTo: instructionOneView.trailingAnchor).isActive = true
        instructionOneTitleLabel.text = instructions.instructionOne
    }
    
    private func setupInstructionTwo() {
        instructionsStackView.addArrangedSubview(instructionTwoView)
        instructionTwoView.leadingAnchor.constraint(equalTo: instructionsStackView.leadingAnchor).isActive = true
        instructionTwoView.trailingAnchor.constraint(equalTo: instructionsStackView.trailingAnchor).isActive = true
        instructionTwoView.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
        
        instructionTwoView.addSubview(instructionTwoNumberView)
        instructionTwoNumberView.centerYAnchor.constraint(equalTo: instructionTwoView.centerYAnchor).isActive = true
        instructionTwoNumberView.leadingAnchor.constraint(equalTo: instructionTwoView.leadingAnchor).isActive = true
        instructionTwoNumberView.heightAnchor.constraint(equalToConstant: 24.0).isActive = true
        instructionTwoNumberView.widthAnchor.constraint(equalToConstant: 24.0).isActive = true
        
        instructionTwoNumberView.addSubview(instructionTwoNumberLabel)
        instructionTwoNumberLabel.centerXAnchor.constraint(equalTo: instructionTwoNumberView.centerXAnchor).isActive = true
        instructionTwoNumberLabel.centerYAnchor.constraint(equalTo: instructionTwoNumberView.centerYAnchor).isActive = true
        
        instructionTwoView.addSubview(instructionTwoTitleLabel)
        instructionTwoTitleLabel.centerYAnchor.constraint(equalTo: instructionTwoView.centerYAnchor).isActive = true
        instructionTwoTitleLabel.leadingAnchor.constraint(equalTo: instructionTwoNumberView.trailingAnchor, constant: 8.0).isActive = true
        instructionTwoTitleLabel.trailingAnchor.constraint(equalTo: instructionTwoView.trailingAnchor).isActive = true
        instructionTwoTitleLabel.text = instructions.instructionTwo
    }
    
    private func setupInstructionThree() {
        instructionsStackView.addArrangedSubview(instructionThreeView)
        instructionThreeView.leadingAnchor.constraint(equalTo: instructionsStackView.leadingAnchor).isActive = true
        instructionThreeView.trailingAnchor.constraint(equalTo: instructionsStackView.trailingAnchor).isActive = true
        instructionThreeView.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
        
        instructionThreeView.addSubview(instructionThreeNumberView)
        instructionThreeNumberView.centerYAnchor.constraint(equalTo: instructionThreeView.centerYAnchor).isActive = true
        instructionThreeNumberView.leadingAnchor.constraint(equalTo: instructionThreeView.leadingAnchor).isActive = true
        instructionThreeNumberView.heightAnchor.constraint(equalToConstant: 24.0).isActive = true
        instructionThreeNumberView.widthAnchor.constraint(equalToConstant: 24.0).isActive = true
        
        instructionThreeNumberView.addSubview(instructionThreeNumberLabel)
        instructionThreeNumberLabel.centerXAnchor.constraint(equalTo: instructionThreeNumberView.centerXAnchor).isActive = true
        instructionThreeNumberLabel.centerYAnchor.constraint(equalTo: instructionThreeNumberView.centerYAnchor).isActive = true
        
        instructionThreeView.addSubview(instructionThreeTitleLabel)
        instructionThreeTitleLabel.centerYAnchor.constraint(equalTo: instructionThreeView.centerYAnchor).isActive = true
        instructionThreeTitleLabel.leadingAnchor.constraint(equalTo: instructionThreeNumberView.trailingAnchor, constant: 8.0).isActive = true
        instructionThreeTitleLabel.trailingAnchor.constraint(equalTo: instructionThreeView.trailingAnchor).isActive = true
        instructionThreeTitleLabel.text = instructions.instructionThree
    }
    
    private func setupInstructionFour() {
        instructionsStackView.addArrangedSubview(instructionFourView)
        instructionFourView.leadingAnchor.constraint(equalTo: instructionsStackView.leadingAnchor).isActive = true
        instructionFourView.trailingAnchor.constraint(equalTo: instructionsStackView.trailingAnchor).isActive = true
        instructionFourView.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
        
        instructionFourView.addSubview(instructionFourNumberView)
        instructionFourNumberView.centerYAnchor.constraint(equalTo: instructionFourView.centerYAnchor).isActive = true
        instructionFourNumberView.leadingAnchor.constraint(equalTo: instructionFourView.leadingAnchor).isActive = true
        instructionFourNumberView.heightAnchor.constraint(equalToConstant: 24.0).isActive = true
        instructionFourNumberView.widthAnchor.constraint(equalToConstant: 24.0).isActive = true
        
        instructionFourNumberView.addSubview(instructionFourNumberLabel)
        instructionFourNumberLabel.centerXAnchor.constraint(equalTo: instructionFourNumberView.centerXAnchor).isActive = true
        instructionFourNumberLabel.centerYAnchor.constraint(equalTo: instructionFourNumberView.centerYAnchor).isActive = true
        
        instructionFourView.addSubview(instructionFourTitleLabel)
        instructionFourTitleLabel.centerYAnchor.constraint(equalTo: instructionFourView.centerYAnchor).isActive = true
        instructionFourTitleLabel.leadingAnchor.constraint(equalTo: instructionFourNumberView.trailingAnchor, constant: 8.0).isActive = true
        instructionFourTitleLabel.trailingAnchor.constraint(equalTo: instructionFourView.trailingAnchor).isActive = true
        instructionFourTitleLabel.text = instructions.instructionFour
    }
    
    private func setupInstructionFive() {
        instructionsStackView.addArrangedSubview(instructionFiveView)
        instructionFiveView.leadingAnchor.constraint(equalTo: instructionsStackView.leadingAnchor).isActive = true
        instructionFiveView.trailingAnchor.constraint(equalTo: instructionsStackView.trailingAnchor).isActive = true
        instructionFiveView.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
        instructionFiveView.isHidden = instructions.instructionFiveIsHidden
        
        instructionFiveView.addSubview(instructionFiveNumberView)
        instructionFiveNumberView.centerYAnchor.constraint(equalTo: instructionFiveView.centerYAnchor).isActive = true
        instructionFiveNumberView.leadingAnchor.constraint(equalTo: instructionFiveView.leadingAnchor).isActive = true
        instructionFiveNumberView.heightAnchor.constraint(equalToConstant: 24.0).isActive = true
        instructionFiveNumberView.widthAnchor.constraint(equalToConstant: 24.0).isActive = true
        
        instructionFiveNumberView.addSubview(instructionFiveNumberLabel)
        instructionFiveNumberLabel.centerXAnchor.constraint(equalTo: instructionFiveNumberView.centerXAnchor).isActive = true
        instructionFiveNumberLabel.centerYAnchor.constraint(equalTo: instructionFiveNumberView.centerYAnchor).isActive = true
        
        instructionFiveView.addSubview(instructionFiveTitleLabel)
        instructionFiveTitleLabel.centerYAnchor.constraint(equalTo: instructionFiveView.centerYAnchor).isActive = true
        instructionFiveTitleLabel.leadingAnchor.constraint(equalTo: instructionFiveNumberView.trailingAnchor, constant: 8.0).isActive = true
        instructionFiveTitleLabel.trailingAnchor.constraint(equalTo: instructionFiveView.trailingAnchor).isActive = true
        instructionFiveTitleLabel.text = instructions.instructionFive
    }
    
    private func setupLetsGoButton() {
        bodyView.addSubview(letsGoButton)
        letsGoButton.centerXAnchor.constraint(equalTo: bodyView.centerXAnchor).isActive = true
        letsGoButton.bottomAnchor.constraint(equalTo: bodyView.bottomAnchor, constant: -72.0).isActive = true
        letsGoButton.heightAnchor.constraint(equalToConstant: 42.0).isActive = true
        letsGoButton.widthAnchor.constraint(equalToConstant: 150.0).isActive = true
    }
    
    private func setupActivityOverlayView() {
        containerView.addSubview(viewActivityOverlay)
        viewActivityOverlay.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        viewActivityOverlay.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        viewActivityOverlay.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        viewActivityOverlay.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        
        viewActivityOverlay.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: viewActivityOverlay.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: viewActivityOverlay.centerYAnchor, constant: -60.0).isActive = true
    }
    
    private func setupUX() {
        letsGoButton.addTarget(self, action: #selector(tappedLetsGoButton), for: .touchUpInside)
        closeButton.addTarget(self, action: #selector(tappedCloseButton), for: .touchUpInside)
    }
    
    //MARK: - Functions
    @objc private func tappedLetsGoButton() {
        startDemo()
    }
    
    @objc private func tappedCloseButton() {
        dismiss(animated: true)
    }

    private func startDemo() {
        startCapture?()
    }
    
    private func showAlertError() {
        let alertController = UIAlertController(title: "Ooops!", message: "Desculpe o transtorno, mas ocorreu um erro. Por favor, tente novamente.", preferredStyle: .alert)

        let alertAction = UIAlertAction(title: "OK", style: .default) { (_) in
            alertController.dismiss(animated: true)
        }

        alertController.addAction(alertAction)

        present(alertController, animated: true)
    }
    
    private func getFullOCR() {
        showHideActivityOverlay(show: true)
        
        let dataArray = convertImageArrayToDataArray()
        
        service.getFullOCR(dataArray: dataArray) { [weak self] result in
            guard let self = self else { return }
            self.showHideActivityOverlay(show: false)
            
            guard let json = result else { return }
            let successModel = SuccessOCRModel(isDocumentDetected: true, json: json)
            DispatchQueue.main.async {
                self.goToSuccessViewController(model: successModel)
            }
        }
    }
    
    private func goToSuccessViewController(model: SuccessOCRModel) {
        let successViewController = SuccessViewController(model: model)
        successViewController.delegate = self
        present(successViewController, animated: true)
    }
    
    private func showHideActivityOverlay(show: Bool) {
        DispatchQueue.main.async {
            if show {
                self.viewActivityOverlay.isHidden = false
                self.activityIndicator.startAnimating()
            } else {
                self.viewActivityOverlay.isHidden = true
                self.activityIndicator.stopAnimating()
            }
        }
    }
    
    private func convertImageArrayToDataArray() -> [Data] {
        var dataArray = [Data]()
        imageArray.forEach { image in
            guard let imageData = image.jpegData(compressionQuality: 1.0) else { return }
            dataArray.append(imageData)
        }
        return dataArray
    }
}

//MARK: - LivenessCameraViewControllerDelegate
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

//MARK: - DocumentCameraViewControllerDelegate
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

// MARK: - SuccessViewControllerDelegate
extension StartViewController: SuccessViewControllerDelegate {
    func successViewControllerMainAction() {
        imageArray.removeAll()
        dismiss(animated: true)
    }
}

// MARK: - FailureViewControllerDelegate
extension StartViewController: FailureViewControllerDelegate {
    func failureViewControllerMainAction() {
        imageArray.removeAll()
        dismiss(animated: true) {
            self.startDemo()
        }
    }
}

// MARK: - OtherSideDocumentDelegate
extension StartViewController: OtherSideDocumentDelegate {
    func captureOtherSideDocument() {
        dismiss(animated: true) {
            self.startDemo()
        }
    }
    
    func noCaptureOtherSideDocument() {
        dismiss(animated: true) {
            self.getFullOCR()
        }
    }
}
