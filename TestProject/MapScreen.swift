//
//  MapScreen.swift
//  TestProject
//
//  Created by Xenia Sidorova on 18.01.2021.
//

import UIKit

class MapScreen: UIViewController {
    var userName: String?

    override func viewDidLoad() {
        super.viewDidLoad()
            title = userName
            view.backgroundColor = .systemGray6
        
    }


}
