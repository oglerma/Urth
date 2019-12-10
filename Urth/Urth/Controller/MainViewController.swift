//
//  ViewController.swift
//  Urth
//
//  Created by Lerma, Ociel(AWF) on 12/6/19.
//  Copyright © 2019 Lerma, Ociel. All rights reserved.
//

import UIKit
import Network

fileprivate let cellId = "cell"
class MainViewController: UIViewController {
    

    private let tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .plain)
        tv.separatorStyle = .none
        tv.register(EarthquakeCustomCell.self, forCellReuseIdentifier: cellId)
        tv.accessibilityIdentifier = "main_tblview_id"
        return tv
    }()
    
    var activityIndicator = ActivityIndicator(frame: .zero)
    let monitor = NWPathMonitor()
    
    var earthquakesArray = [Feature]()
    var someData = [String]()

    func monitorNetworkConnectivity(){
        monitor.pathUpdateHandler = { path in
            if path.status != .satisfied {
                DispatchQueue.main.async {
                    // Only one alert controller can be present at a time
                    if self.presentedViewController == nil {
                        self.showNetworkErrorAlert(title: "NETWORK ERROR",
                        message: "Please check connectivity")
                    }
                }
            }
        }
        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)
    }
    
    func setupView(){
        view.backgroundColor = .black
        let mainSearchView = MainSearchView(frame: .zero)
        mainSearchView.searchDelegate = self
        navigationController?.navigationBar.barTintColor =  #colorLiteral(red: 0.4020084143, green: 0.689712584, blue: 0.1968233883, alpha: 1)
        navigationController?.navigationBar.shadowImage = UIImage()
        title = "Search for Earthquakes"
        view.addSubview(tableView)
        view.addSubview(mainSearchView)
        view.addSubview(activityIndicator)
        tableView.delegate = self
        tableView.dataSource = self
        mainSearchView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor,
                         bottom: nil, trailing: view.trailingAnchor,
                         centerXaxis: nil, centerYaxis: nil, size: .init(width: 0, height: 150))
        
        tableView.anchor(top: mainSearchView.bottomAnchor, leading: view.leadingAnchor,
                         bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor,
                         centerXaxis: nil, centerYaxis: nil)
        
        activityIndicator.anchor(top: nil, leading: nil, bottom: nil, trailing: nil,
                                 centerXaxis: view.centerXAnchor, centerYaxis: view.centerYAnchor,
                                 size: .init(width: 100, height: 100))
    }
    
    func transformDate(milliseconds: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(milliseconds/1000))
        return DateFormatter.localizedString(from: date, dateStyle: .medium, timeStyle: .none)
    }
    
    func showMissingInfoAlertController(title: String, message: String){
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel)
        ac.addAction(alertAction)
        present(ac, animated: true)
    }
    
    func showNetworkErrorAlert(title: String, message: String){
        let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        let alertAction = UIAlertAction(title: "OK", style: .cancel)
        ac.addAction(alertAction)
        present(ac, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        monitorNetworkConnectivity()
        setupView()
    }

}

// TableView
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return earthquakesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! EarthquakeCustomCell
        let placeString = earthquakesArray[indexPath.row].properties.place
        cell.place.attributedText = NSAttributedString(string: placeString, attributes:
        [.underlineStyle: NSUnderlineStyle.single.rawValue])
        let milSeconds = earthquakesArray[indexPath.row].properties.time
        cell.dateDisplayed.text = transformDate(milliseconds: milSeconds)
        cell.magnitude.text = "\(earthquakesArray[indexPath.row].properties.mag)"
        cell.magnitude.layer.cornerRadius = 10
        cell.magnitude.layer.borderWidth = 1
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let vc = EarthquakeDetailViewController()
        vc.cardInfo.place.text = earthquakesArray[indexPath.row].properties.place
        vc.cardInfo.place.textAlignment = .center
        vc.coordinates = earthquakesArray[indexPath.row].geometry.coordinates
        
        vc.cardInfo.coordinates.text = "Lat: \(earthquakesArray[indexPath.row].geometry.coordinates[1]) Lon: \(earthquakesArray[indexPath.row].geometry.coordinates[0])"
        let milliseconds = earthquakesArray[indexPath.row].properties.time
        vc.cardInfo.date.text = "\(transformDate(milliseconds: milliseconds))"
        vc.cardInfo.magnitude.text = "\(earthquakesArray[indexPath.row].properties.mag)m"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.0
    }
}

// Search
extension MainViewController: SearchDelegate {
    func searchTapped(day: Int, country: String, magnitude: Int) {
        if day != 0 && magnitude != 0 && country != ""{
            // Make Request Here
            let calendar = Calendar.current
            let date = Date()
            activityIndicator.startAnimating()
            
            EarthquakeAPI.requestEarthquakeData{ (eartquake, error) in
                if let _ = error {
                    //Show Message for Alert
                    DispatchQueue.main.async {
                        // stop animating if there was an error
                        self.showNetworkErrorAlert(title: "Unable to retrieve data", message: "Please try again later")
                        self.activityIndicator.stopAnimating()
                    }
                }
                guard let earthquakeData = eartquake else {return}
                
                // Getting the Day based on how far the user wants to go
                let howFarBackDate = calendar.date(byAdding: .day, value: -day, to: date)
                // Making the conversion into milliseconds in order to compare with the value received from the API
                let convertIntoMilliseconds = Int(howFarBackDate?.timeIntervalSince1970 ?? 0 * 1000)
                //Filtering dates first then magnitudes
                let newData = earthquakeData.filter({($0.properties.time / 1000) > convertIntoMilliseconds}).filter({$0.properties.mag > Double(magnitude)})
                
                if country == "Show all" {
                    self.earthquakesArray = newData
                }else {
                    self.earthquakesArray = newData.filter({$0.properties.place.contains(country)})
                }
                
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.tableView.reloadData()
                    
                }
            }
        }else {
            showMissingInfoAlertController(title: "Missing days selection",
                                           message: "Select up to 30 days back")
        }
    }
    
    
}







