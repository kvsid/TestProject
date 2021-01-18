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
/* {
 "places": [
   {
       "id":1,
       "name":"Independence Square",
       "lat":50.450555,
       "lng":30.5210808
   },
   {
       "id":2,
       "name":"Khreschatyk Street",
     "lat": 50.4475888,
     "lng": 30.5198317
   },
   {
       "id":3,
       "name":"National Opera of Ukraine",
     "lat": 50.44671,
     "lng": 30.5101755
   }
 ]
}
 */
