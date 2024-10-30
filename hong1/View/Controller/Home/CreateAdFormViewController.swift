//
//  CreateAdFormViewController.swift
//  hong1
//
//  Created by NAHØM on 27/10/2024.
//

import UIKit

class CreateAdFormViewController: UIViewController {
    
    private var collectionView: UICollectionView!
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "광고 정보를 \n입력해 주세요."
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "제목"
        return label
    }()
    
    private let titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "3글자 이상 제목을 입력해주세요."
        textField.borderStyle = .none
        return textField
    }()
    
    private let separatorView1: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let advertiserLabel: UILabel = {
        let label = UILabel()
        label.text = "광고주"
        return label
    }()
    
    private let advertiserTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "광고주 성함을 입력해주세요"
        textField.borderStyle = .none
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    private let separatorView2: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "전화번호"
        return label
    }()
    
    private let phoneTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "광고주 전화번호를 입력해주세요"
        textField.borderStyle = .none
        textField.keyboardType = .phonePad
        return textField
    }()
    
    private let separatorView3: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.text = "주소지"
        return label
    }()
    
    private let addressTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "주소 검색"
        textField.borderStyle = .none
        return textField
    }()
    
    private let separatorView4: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let detailAddressTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "상세주소 입력"
        textField.borderStyle = .none
        return textField
    }()
    
    private let separatorView5: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // Week days picker
    
    // time picker
    
    private let adContentLabel1: UILabel = {
        let label = UILabel()
        label.text = "광고 내용"
        return label
    }()
    
    private let adSubcontentLabel1: UILabel = {
        let label = UILabel()
        label.text = "1. 가게 및 메뉴 소개"
        label.textColor = .colord5d5d5
        return label
    }()
    
    private let adDescriptionLabel1: UILabel = {
        let label = UILabel()
        label.text = "LA갈비 세트 - 정성껏 숙성하여 만든 LA갈비와 함께 \n함흥냉면 또는 된장찌개 둘중 하나 선택하여 드실수 \n있는 메뉴입니다."
        label.numberOfLines = 3
        label.textColor = .colord5d5d5
        return label
    }()
    
    private let adSubcontentLabel2: UILabel = {
        let label = UILabel()
        label.text = "2. 장점, 특별한점"
        label.textColor = .colord5d5d5
        return label
    }()
    
    private let adDescriptionLabel2: UILabel = {
        let label = UILabel()
        label.text = "100% 국내산, 최상품만 엄선, 농장에서 직접 재배했습니다."
        label.textColor = .colord5d5d5
        return label
    }()
    
    private let adSubcontentLabel3: UILabel = {
        let label = UILabel()
        label.text = "2. 사장님 한마디"
        label.textColor = .colord5d5d5
        return label
    }()
    
    private let adDescriptionLabel3: UILabel = {
        let label = UILabel()
        label.text = "100% 국내산, 최상품만 엄선, 농장에서 직접 재배했습니다."
        label.textColor = .colord5d5d5
        return label
    }()
    
    private let separatorView6: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let postingDateLabel: UILabel = {
        let label = UILabel()
        label.text = "광고게시일 설정"
        return label
    }()
    
    private let checkbox1: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "checkmark.square")
        return view
    }()
    
    private let todayLabel: UILabel = {
        let label = UILabel()
        label.text = "오늘부터 게시"
        return label
    }()
    
    private let checkbox2: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "checkmark.square")
        view.tintColor = .color8e8e8e
        return view
    }()
    
    private let anotherDayLabel: UILabel = {
        let label = UILabel()
        label.text = "다른 날짜 선택"
        label.textColor = .color8e8e8e
        return label
    }()
    
    private let submitButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .colorfa4e29
        button.setTitle("등록하기", for: .normal)
        button.titleLabel?.font = .ptBold18Font
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupViews()
    }
    
    private func setupNavigationBar(){
        self.title = "광고만들기(무료)"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(didTapBack))
    }
    
    @objc func didTapBack() {
        navigationController?.popViewController(animated: true)
    }
    
    func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(headerLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(titleTextField)
        contentView.addSubview(separatorView1)
        contentView.addSubview(advertiserLabel)
        contentView.addSubview(advertiserTextField)
        contentView.addSubview(separatorView2)
        contentView.addSubview(phoneLabel)
        contentView.addSubview(phoneTextField)
        contentView.addSubview(separatorView3)
        contentView.addSubview(addressLabel)
        contentView.addSubview(addressTextField)
        contentView.addSubview(separatorView4)
        contentView.addSubview(detailAddressTextField)
        contentView.addSubview(separatorView5)
        contentView.addSubview(adContentLabel1)
        contentView.addSubview(adSubcontentLabel1)
        contentView.addSubview(adDescriptionLabel1)
        contentView.addSubview(adSubcontentLabel2)
        contentView.addSubview(adDescriptionLabel2)
        contentView.addSubview(adSubcontentLabel3)
        contentView.addSubview(adDescriptionLabel3)
        contentView.addSubview(separatorView6)
        contentView.addSubview(postingDateLabel)
        contentView.addSubview(checkbox1)
        contentView.addSubview(todayLabel)
        contentView.addSubview(checkbox2)
        contentView.addSubview(anotherDayLabel)
        contentView.addSubview(submitButton)
        
        
        // Create the label for right view
        let searchLabel = UILabel()
        searchLabel.text = "검색하기"
        searchLabel.sizeToFit()
        searchLabel.backgroundColor = .coloreff1f5
        searchLabel.layer.cornerRadius = 10
        searchLabel.clipsToBounds = true // Ensure the corners are rounded
        addressTextField.rightViewMode = .always
        addressTextField.rightView = searchLabel // Set the right view

        // Set constraints for the scroll view
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -40)
        ])
        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        separatorView1.translatesAutoresizingMaskIntoConstraints = false
        advertiserLabel.translatesAutoresizingMaskIntoConstraints = false
        advertiserTextField.translatesAutoresizingMaskIntoConstraints = false
        separatorView2.translatesAutoresizingMaskIntoConstraints = false
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneTextField.translatesAutoresizingMaskIntoConstraints = false
        separatorView3.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addressTextField.translatesAutoresizingMaskIntoConstraints = false
        separatorView4.translatesAutoresizingMaskIntoConstraints = false
        detailAddressTextField.translatesAutoresizingMaskIntoConstraints = false
        separatorView5.translatesAutoresizingMaskIntoConstraints = false
        adContentLabel1.translatesAutoresizingMaskIntoConstraints = false
        adSubcontentLabel1.translatesAutoresizingMaskIntoConstraints = false
        adDescriptionLabel1.translatesAutoresizingMaskIntoConstraints = false
        adSubcontentLabel2.translatesAutoresizingMaskIntoConstraints = false
        adDescriptionLabel2.translatesAutoresizingMaskIntoConstraints = false
        adSubcontentLabel3.translatesAutoresizingMaskIntoConstraints = false
        adDescriptionLabel3.translatesAutoresizingMaskIntoConstraints = false
        separatorView6.translatesAutoresizingMaskIntoConstraints = false
        postingDateLabel.translatesAutoresizingMaskIntoConstraints = false
        checkbox1.translatesAutoresizingMaskIntoConstraints = false
        todayLabel.translatesAutoresizingMaskIntoConstraints = false
        checkbox2.translatesAutoresizingMaskIntoConstraints = false
        anotherDayLabel.translatesAutoresizingMaskIntoConstraints = false
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            headerLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            titleLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 60),
            titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            titleTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            titleTextField.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            titleTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            separatorView1.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 10),
            separatorView1.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            separatorView1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            separatorView1.heightAnchor.constraint(equalToConstant: 1),
            
            advertiserLabel.topAnchor.constraint(equalTo: separatorView1.bottomAnchor, constant: 20),
            advertiserLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            advertiserLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            advertiserTextField.topAnchor.constraint(equalTo: advertiserLabel.bottomAnchor, constant: 20),
            advertiserTextField.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            advertiserTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            separatorView2.topAnchor.constraint(equalTo: advertiserTextField.bottomAnchor, constant: 10),
            separatorView2.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            separatorView2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            separatorView2.heightAnchor.constraint(equalToConstant: 1),
            
            phoneLabel.topAnchor.constraint(equalTo: separatorView2.bottomAnchor, constant: 20),
            phoneLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            phoneLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            phoneTextField.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 20),
            phoneTextField.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            phoneTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            separatorView3.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 10),
            separatorView3.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            separatorView3.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            separatorView3.heightAnchor.constraint(equalToConstant: 1),
            
            addressLabel.topAnchor.constraint(equalTo: separatorView3.bottomAnchor, constant: 20),
            addressLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            addressLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            addressTextField.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 20),
            addressTextField.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            addressTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            separatorView4.topAnchor.constraint(equalTo: addressTextField.bottomAnchor, constant: 10),
            separatorView4.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            separatorView4.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            separatorView4.heightAnchor.constraint(equalToConstant: 1),
            
            detailAddressTextField.topAnchor.constraint(equalTo: separatorView4.bottomAnchor, constant: 20),
            detailAddressTextField.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            detailAddressTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            separatorView5.topAnchor.constraint(equalTo: detailAddressTextField.bottomAnchor, constant: 10),
            separatorView5.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            separatorView5.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            separatorView5.heightAnchor.constraint(equalToConstant: 1),
            
            adContentLabel1.topAnchor.constraint(equalTo: separatorView5.bottomAnchor, constant: 20),
            adContentLabel1.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            adContentLabel1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            adSubcontentLabel1.topAnchor.constraint(equalTo: adContentLabel1.bottomAnchor, constant: 20),
            adSubcontentLabel1.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            adSubcontentLabel1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            adDescriptionLabel1.topAnchor.constraint(equalTo: adSubcontentLabel1.bottomAnchor, constant: 10),
            adDescriptionLabel1.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            adDescriptionLabel1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            adSubcontentLabel2.topAnchor.constraint(equalTo: adDescriptionLabel1.bottomAnchor, constant: 40),
            adSubcontentLabel2.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            adSubcontentLabel2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            adDescriptionLabel2.topAnchor.constraint(equalTo: adSubcontentLabel2.bottomAnchor, constant: 10),
            adDescriptionLabel2.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            adDescriptionLabel2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            adSubcontentLabel3.topAnchor.constraint(equalTo: adDescriptionLabel2.bottomAnchor, constant: 40),
            adSubcontentLabel3.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            adSubcontentLabel3.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            adDescriptionLabel3.topAnchor.constraint(equalTo: adSubcontentLabel3.bottomAnchor, constant: 10),
            adDescriptionLabel3.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            adDescriptionLabel3.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            separatorView6.topAnchor.constraint(equalTo: adDescriptionLabel3.bottomAnchor, constant: 40),
            separatorView6.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            separatorView6.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            separatorView6.heightAnchor.constraint(equalToConstant: 1),
//            separatorView6.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            postingDateLabel.topAnchor.constraint(equalTo: separatorView6.bottomAnchor, constant: 20),
            postingDateLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            postingDateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            checkbox1.topAnchor.constraint(equalTo: postingDateLabel.bottomAnchor, constant: 20),
            checkbox1.widthAnchor.constraint(equalToConstant: 20),
            checkbox1.heightAnchor.constraint(equalToConstant: 20),
            checkbox1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            todayLabel.topAnchor.constraint(equalTo: postingDateLabel.bottomAnchor, constant: 20),
            todayLabel.widthAnchor.constraint(equalToConstant: 100),
            todayLabel.heightAnchor.constraint(equalToConstant: 20),
            todayLabel.leadingAnchor.constraint(equalTo: checkbox1.trailingAnchor, constant: 10),
            
            checkbox2.topAnchor.constraint(equalTo: postingDateLabel.bottomAnchor, constant: 20),
            checkbox2.widthAnchor.constraint(equalToConstant: 20),
            checkbox2.heightAnchor.constraint(equalToConstant: 20),
            checkbox2.leadingAnchor.constraint(equalTo: todayLabel.trailingAnchor, constant: 20),
            
            anotherDayLabel.topAnchor.constraint(equalTo: postingDateLabel.bottomAnchor, constant: 20),
            anotherDayLabel.widthAnchor.constraint(equalToConstant: 150),
            anotherDayLabel.heightAnchor.constraint(equalToConstant: 20),
            anotherDayLabel.leadingAnchor.constraint(equalTo: checkbox2.trailingAnchor, constant: 10),
//            anotherDayLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            submitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            submitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            submitButton.heightAnchor.constraint(equalToConstant: 58),
            submitButton.topAnchor.constraint(equalTo: anotherDayLabel.bottomAnchor, constant: 20),
            submitButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
