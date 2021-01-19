//
//  Marks.swift
//  TestProject
//
//  Created by Xenia Sidorova on 18.01.2021.
//

import UIKit

struct Marks: Codable {
    let places: [Place]
}

struct Place: Codable {
    let id: Int
    let name: String
    let lat: Double
    let lng: Double
}
