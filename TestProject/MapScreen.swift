//
//  MapScreen.swift
//  TestProject
//
//  Created by Xenia Sidorova on 18.01.2021.
//

import UIKit
import MapKit

class MapScreen: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var userName: String?
    private var placesTable = UITableView()
    private var places = [Place]()
    private var map = MKMapView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = userName
        view.backgroundColor = .systemGray6
        setupTable()
        setupMap()
        requestPlaces()

        let initialLocation = CLLocation(latitude: 50.45466, longitude: 30.5238) // Kyiv, Ukraine
        let region = MKCoordinateRegion(center: initialLocation.coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
        map.setRegion(region, animated: true)
    }

    private func setupMapAnnotations() {
        for place in self.places {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: place.lat, longitude: place.lng)
            annotation.title = place.name
            map.addAnnotation(annotation)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "place", for: indexPath) as! Cell
        let place = places[indexPath.row]
        cell.currentPlace.text = place.name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let placeName = places[indexPath.row].name
        for annotation in map.annotations {
            if annotation.title == placeName {
                map.selectAnnotation(annotation, animated: true)
                let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
                map.setRegion(region, animated: true)
            }
        }
    }

    private func setupMap() {
        map.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height/2)
        view.addSubview(map)
    }

    private func setupTable() {
        placesTable.frame = CGRect(x: 0, y: view.frame.height/2, width: view.frame.width, height: view.frame.height/2)
        placesTable.delegate = self
        placesTable.dataSource = self
        placesTable.register(Cell.self, forCellReuseIdentifier: "place")
        view.addSubview(placesTable)
    }

    private func requestPlaces() {
        let url = URL(string: "https://3lolo.github.io/lat_lng.json")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil, response != nil else {
                print("Something went wrong. The data nil")
                return
            }
            do {
                let decodedData = try JSONDecoder().decode(Marks.self, from: data)
                self.places = decodedData.places
                DispatchQueue.main.async {
                    self.placesTable.reloadData()
                    self.setupMapAnnotations()
                }
            } catch {
                print("Something went wrong")
            }
        }.resume()
    }
}
