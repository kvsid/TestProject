//
//  Cell.swift
//  TestProject
//
//  Created by Xenia Sidorova on 18.01.2021.
//

import UIKit

class Cell: UITableViewCell {
    var currentPlace: UILabel = {
        var name = UILabel(frame: CGRect(x: 20.0, y: 15.0, width: 300.0, height: 30))
        return name
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(currentPlace)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
