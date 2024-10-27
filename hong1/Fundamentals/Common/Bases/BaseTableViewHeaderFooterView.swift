//
//  BaseTableViewHeaderFooterView.swift
//  ABEE
//
//  Created by 엄지호 on 10/2/24.
//

import UIKit

class BaseTableViewHeaderFooterView: UITableViewHeaderFooterView {
    
    // MARK: - Init
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        configureAttributes()
        configureLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration
    func configureAttributes() { }
    func configureLayouts() { }
}

