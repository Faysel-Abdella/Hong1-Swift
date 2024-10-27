//
//  BaseCollectionReusableView.swift
//  ABEE
//
//  Created by 엄지호 on 10/2/24.
//

import UIKit

class BaseCollectionReusableView: UICollectionReusableView {
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        
        configureAttributes()
        configureLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration
    func configureAttributes() {

    }
    
    func configureLayouts() {
        
    }
}
