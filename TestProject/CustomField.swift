//
//  CustomField.swift
//  TestProject
//
//  Created by Xenia Sidorova on 18.01.2021.
//

import UIKit

class CustomField : UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 5
        backgroundColor = .white
        layer.borderColor = UIColor.systemPurple.cgColor
        layer.borderWidth = 3
        textAlignment = .center
        contentVerticalAlignment = .center
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
