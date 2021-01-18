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
        self.layer.cornerRadius = 5
        self.backgroundColor = .white
        self.layer.borderColor = UIColor.systemPurple.cgColor
        self.layer.borderWidth = 3
        self.textAlignment = .center
        self.contentVerticalAlignment = .center
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
