//
//  WarningPopUpViewController.swift
//  hong1
//
//  Created by Yohannes Haile on 10/29/24.
//

import UIKit

class WarningPopUpViewController: UIViewController {
    var nav: UINavigationController?
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
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
        imageView.image = UIImage(systemName: "exclamationmark.circle.fill")
        imageView.tintColor = .colordbdbdb
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

        attributedString.addAttribute(.foregroundColor, value: UIColor.colorfa4e29, range: NSRange(location: 0, length: 8))
        attributedString.addAttribute(.font, value: UIFont.ptExtraBold16Font!, range: NSRange(location: 0, length: 8))

        attributedString.addAttribute(.foregroundColor, value: UIColor.color242424, range: NSRange(location: 8, length: 19))
        attributedString.addAttribute(.font, value: UIFont.ptExtraBold16Font!, range: NSRange(location: 8, length: 19))


        let remainingRange = NSRange(location: 19, length: text.count - 19)
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
        
        collectionView.register(WarningCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
    }

    private func setUpViews(){
        view.backgroundColor = .systemBackground
        
        view.addSubview(containerView)
        containerView.addSubview(closeButton)
        closeButton.addTarget(nil, action: #selector(dismissPopup), for: .touchUpInside)
        containerView.addSubview(warningIconImageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(requestLabel)
        containerView.addSubview(separatorView)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(collectionView)
        containerView.addSubview(approvalButton)
        approvalButton.addTarget(nil, action: #selector(goToForm), for: .touchUpInside)
    }
    
    @objc func dismissPopup() {
        dismiss(animated: true)
    }
    @objc func goToForm() {
        dismiss(animated: true) {
            guard let nav = self.nav else { return }
            nav.pushViewController(CreateAdFormViewController(), animated: true)
        }
    }
    private func setUpCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    private func applyConstraints(){
        containerView.translatesAutoresizingMaskIntoConstraints = false
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        warningIconImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        requestLabel.translatesAutoresizingMaskIntoConstraints = false
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        approvalButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            containerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.8),
            
            closeButton.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor, constant: 13),
            closeButton.trailingAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.trailingAnchor, constant: -13),
            closeButton.widthAnchor.constraint(equalToConstant: 28),
            closeButton.heightAnchor.constraint(equalToConstant: 28),

            warningIconImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 35),
            warningIconImageView.centerXAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.centerXAnchor),
            warningIconImageView.widthAnchor.constraint(equalToConstant: 50),
            warningIconImageView.heightAnchor.constraint(equalToConstant: 50),

            titleLabel.topAnchor.constraint(equalTo: warningIconImageView.bottomAnchor, constant: 14.1),
            titleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 29),

            requestLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 14.1),
            requestLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            requestLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor),
            requestLabel.heightAnchor.constraint(equalToConstant: 42),

            separatorView.topAnchor.constraint(equalTo: requestLabel.bottomAnchor, constant: 10.8),
            separatorView.leadingAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.leadingAnchor, constant: 37.6),
            separatorView.trailingAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.trailingAnchor, constant: -37.6),
            separatorView.heightAnchor.constraint(equalToConstant: 1),

            descriptionLabel.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 21),
            descriptionLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            descriptionLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 43),


            collectionView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.leadingAnchor, constant: 28),
            collectionView.trailingAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.trailingAnchor, constant: -28),
            collectionView.bottomAnchor.constraint(equalTo: approvalButton.topAnchor, constant: -26.6),

            approvalButton.bottomAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            approvalButton.leadingAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            approvalButton.trailingAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            approvalButton.heightAnchor.constraint(equalToConstant: 58)
        ])
    }
}

extension WarningPopUpViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let title = [
            "다단계, \n불법 도박",
            "사적인 \n모임 광고",
            "무허가 민간요법 \n의료행위",
            "주식 코인 \n트레이딩 광고",
            "개인이 올린 \n정치 광고",
            "중고물품 \n판매 광고",
            "룸사롱 등 \n퇴폐업소",
            "개인이 올린 \n종교나 사건사고",
        ]
        let image = [
            "no6",
            "no7",
            "no8",
            "no10",
            "no11",
            "no12",
            "no1",
            "no3"
        ]
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? WarningCollectionViewCell else { return UICollectionViewCell() }
        cell.title = title[indexPath.row]
        cell.image = image[indexPath.row]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: containerView.bounds.size.width*0.4, height: 84.8 - 10)
    }


}
