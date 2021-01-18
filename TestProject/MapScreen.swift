//
//  MapScreen.swift
//  TestProject
//
//  Created by Xenia Sidorova on 18.01.2021.
//

import UIKit

class MapScreen: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var userName: String?
    var placesTable = UITableView()
    var marks = [Place]()


    override func viewDidLoad() {
        super.viewDidLoad()
            title = userName
            view.backgroundColor = .systemGray6
            setupTable()
            requestMarks()
        print(marks)
    }

    private func setupTable() {
        placesTable = UITableView(frame: view.frame, style: .plain)
        placesTable.delegate = self
        placesTable.dataSource = self
        placesTable.register(Cell.self, forCellReuseIdentifier: "place")

        view.addSubview(placesTable)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return marks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "place", for: indexPath) as! Cell
        let place = marks[indexPath.row]
        cell.currentPlace.text = place.name
        return cell
        
    }

    private func requestMarks() {
//        let url = URL(string: "https://2fjd9l3x1l.api.quickmocker.com/kyiv/places")!
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data = data, error == nil, response != nil else {
//                print("Something went wrong. The data nil")
//                return
//            }
        let data = """
        {
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
        """.data(using: .utf8)!
            do {

                let decodedData = try JSONDecoder().decode(Marks.self, from: data)

                self.marks = decodedData.places
                DispatchQueue.main.async {
                    self.placesTable.reloadData()
                }
            } catch {
                print("Something went wrong")
            }
//        }.resume()
    }
}
