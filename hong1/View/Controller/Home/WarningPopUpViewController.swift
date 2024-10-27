//
//  WarningPopUpViewController.swift
//  hong1
//
//  Created by Yohannes Haile on 10/26/24.
//

import UIKit

class WarningPopUpViewController: UIViewController {

    private let closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "close"), for: .normal)
        return button
    }()
    
    
    private let warningIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "warning")
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .ptBold24Font
        label.textColor = .colorfa4e29
        label.text = "광고만들기 유의사항"
        label.textAlignment = .center
        return label
    }()
    
    private let requestLabel: UILabel = {
        let label = UILabel()
        label.font = .ptSemiBold16Font
        label.textColor = .color2e2e2e
        label.text = "광고를 업로드 하기 전에 다음 유의사항을\n꼭 시켜주시기 바랍니다."
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    private let separatorView: UIView = {
        let line = UIView()
        line.backgroundColor = .colorb5b5b5
        return line
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        let text = "광고 제한 업종은 다음과 같습니다.\n부적절한 광고 업로드시 회원자격이 상실될 수 있습니다."
        let attributedString = NSMutableAttributedString(string: text)
        
        attributedString.addAttribute(.foregroundColor, value: UIColor.colorfa4e29, range: NSRange(location: 0, length: 6))
        attributedString.addAttribute(.font, value: UIFont.ptExtraBold16Font!, range: NSRange(location: 0, length: 6))
        
        attributedString.addAttribute(.foregroundColor, value: UIColor.color242424, range: NSRange(location: 6, length: 8))
        attributedString.addAttribute(.font, value: UIFont.ptExtraBold16Font!, range: NSRange(location: 6, length: 8))
        
        
        let remainingRange = NSRange(location: 14, length: text.count - 14)
        attributedString.addAttribute(.foregroundColor, value: UIColor.color242424, range: remainingRange)
        attributedString.addAttribute(.font, value: UIFont.ptMedium14Font!, range: remainingRange)
        
        label.attributedText = attributedString
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .white
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collection
    }()
    
    private let approvalButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .colorfa4e29
        button.setTitle("확인했어요", for: .normal)
        button.titleLabel?.font = .ptBold18Font
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        setUpCollectionView()
        applyConstraints()
    }
    
    private func setUpViews(){
        view.backgroundColor = .systemBackground
        view.addSubview(closeButton)
        view.addSubview(warningIconImageView)
        view.addSubview(titleLabel)
        view.addSubview(requestLabel)
        view.addSubview(separatorView)
        view.addSubview(descriptionLabel)
        view.addSubview(collectionView)
        view.addSubview(approvalButton)
    }
    
    private func setUpCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func applyConstraints(){
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        warningIconImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        requestLabel.translatesAutoresizingMaskIntoConstraints = false
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        approvalButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 13),
            closeButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -13),
            closeButton.widthAnchor.constraint(equalToConstant: 28),
            closeButton.heightAnchor.constraint(equalToConstant: 28),
            
            warningIconImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 35),
            warningIconImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            warningIconImageView.widthAnchor.constraint(equalToConstant: 50),
            warningIconImageView.heightAnchor.constraint(equalToConstant: 50),
            
            titleLabel.topAnchor.constraint(equalTo: warningIconImageView.bottomAnchor, constant: 14.1),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 97),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -97),
            titleLabel.heightAnchor.constraint(equalToConstant: 29),
            
            requestLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 14.1),
            requestLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 63),
            requestLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -63),
            requestLabel.heightAnchor.constraint(equalToConstant: 42),
            
            separatorView.topAnchor.constraint(equalTo: requestLabel.bottomAnchor, constant: 10.8),
            separatorView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 37.6),
            separatorView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -37.6),
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            
            descriptionLabel.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 21),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 43),
            
            
            collectionView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 28.3),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 28),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -28),
            collectionView.bottomAnchor.constraint(equalTo: approvalButton.topAnchor, constant: -26.6),
            
            approvalButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            approvalButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            approvalButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            approvalButton.heightAnchor.constraint(equalToConstant: 58)
        ])
    }
}

extension WarningPopUpViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .systemRed
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 157, height: 84.8)
    }
    
    
}
