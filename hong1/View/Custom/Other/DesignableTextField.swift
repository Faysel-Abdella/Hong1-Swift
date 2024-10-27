//
//  DesignableTextField.swift
//  hong1
//
//  Created by Yohannes Haile on 10/23/24.
//

import UIKit

@IBDesignable class DesignableUITextField: UITextField {
    var isSecuredTextEntry: Bool = true
    
    @IBInspectable var leftViewPadding: CGFloat = 20
    @IBInspectable var rightViewPadding: CGFloat = 20
    @IBInspectable var gapPadding: CGFloat = 10
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        font = .systemFont(ofSize: 15)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setPlaceholderColor(UIColor(named: "PlaceholderColor"))
    }
    
        //     Provides left padding for images
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += leftViewPadding
        return textRect
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.rightViewRect(forBounds: bounds)
        textRect.origin.x -= rightViewPadding
        return textRect
    }
    
    private var textPadding: UIEdgeInsets {
        let p: CGFloat = leftViewPadding + gapPadding + (leftView?.frame.width ?? 0)
        return UIEdgeInsets(top: 0, left: p, bottom: 0, right: 5)
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
    
    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateLeftView()
        }
    }
    
    @IBInspectable var rightImage: UIImage? {
        didSet {
            updateRightView()
        }
    }
    
    private func updateLeftView() {
        if let image = leftImage {
            leftViewMode = .always
            let imageView = UIImageView(frame: CGRect(x:0, y:0, width:20, height:20))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            leftView = imageView
        } else {
            leftViewMode = .never
            leftView = nil
        }
    }
    
    private func updateRightView() {
        if let image = rightImage {
            rightViewMode = .always
            let imageView = UIImageView(frame: CGRect(x:self.bounds.width - 25, y:0, width:15, height:15))
            imageView.isUserInteractionEnabled = true
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            imageView.tintColor = UIColor.black
            rightView = imageView
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(rightImageTapped))
            imageView.addGestureRecognizer(tapGesture)
        } else {
            rightViewMode = .never
            rightView = nil
        }
    }
    
    //shows and hides password
    @objc private func rightImageTapped() {
        if isSecuredTextEntry {
            isSecuredTextEntry = false
            self.isSecureTextEntry = false
            guard let imageView = rightView as? UIImageView else {return}
            imageView.image = UIImage(named: "eye")
        } else {
            isSecuredTextEntry = true
            self.isSecureTextEntry = true
            guard let imageView = rightView as? UIImageView else {return}
            imageView.image = UIImage(named: "eye.slash")
        }
    }
    
    func addLabelWithText(text: String, to imageView: UIImageView) {
        let sqmLabel = UILabel()
        sqmLabel.text = text
        sqmLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        sqmLabel.textColor = .placeholderText
        sqmLabel.sizeToFit()
        sqmLabel.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.addSubview(sqmLabel)
        sqmLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        sqmLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
    }
    
    func setPlaceholderColor(_ color: UIColor?){
        guard let placeholder = self.placeholder, let color = color else { return }
        
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: color
        ]
        
        let attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
        self.attributedPlaceholder = attributedPlaceholder
    }

}
