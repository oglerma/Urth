//
//  ViewController.swift
//  Urth
//
//  Created by Lerma, Ociel(AWF) on 12/6/19.
//  Copyright © 2019 Lerma, Ociel. All rights reserved.
//

import UIKit
fileprivate let cellId = "cell"
class MainViewController: UIViewController {
    

    fileprivate let tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .plain)
        tv.separatorStyle = .none
        tv.allowsSelection = false
        tv.register(EarthquakeCell.self, forCellReuseIdentifier: cellId)
        return tv
    }()
    

    var earthquakesArray = [Feature]()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupView()
        

    }
    
    func setupView(){
        let mainSearchView = MainSearchView(frame: .zero)
        mainSearchView.searchDelegate = self
        navigationController?.navigationBar.barTintColor =  #colorLiteral(red: 0.4020084143, green: 0.689712584, blue: 0.1968233883, alpha: 1)
        navigationController?.navigationBar.shadowImage = UIImage()
        title = "Search for Earthquakes"
        view.addSubview(tableView)
        view.addSubview(mainSearchView)
        tableView.delegate = self
        tableView.dataSource = self
        mainSearchView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor,
                         bottom: nil, trailing: view.trailingAnchor,
                         centerXaxis: nil, centerYaxis: nil, size: .init(width: 0, height: 150))
        
        tableView.anchor(top: mainSearchView.bottomAnchor, leading: view.leadingAnchor,
                         bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor,
                         centerXaxis: nil, centerYaxis: nil)
    }
    
    
    
}

// TableView
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! EarthquakeCell
        cell.place.text = "One text"
        return cell
    }
    
}

// Search
extension MainViewController: SearchDelegate {
    func searchTapped(day: Int, country: String, magnitude: Int) {
        if day != 0 && magnitude != 0 && country != ""{
            // Make Request Here
            // Show ActivitySpinner
            print("We have day: \(day), magnitude:\(magnitude) and country:\(country)")
        }else {
            let ac = UIAlertController(title: "Missing Parameter", message: "Please fill all the search options", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .cancel)
            ac.addAction(alertAction)
            present(ac, animated: true)
        }
    }
    
    
}


























//
//let lastUpdated = Double(EarthquakeData.features[60].properties.time!)
//let epocTime = TimeInterval(lastUpdated) / 1000 // convert it from milliseconds dividing it by 1000
//let unixTimestamp = Date(timeIntervalSince1970: epocTime) //convert unix timestamp to Date
//let dateFormatter = DateFormatter()
//dateFormatter.timeZone = NSTimeZone() as TimeZone
//dateFormatter.locale = Locale(identifier: "en_US_POSIX")
//dateFormatter.dateFormat =  "yyyy-MM-dd"
//dateFormatter.string(from: unixTimestamp)
//
//let updatedTimeStamp = unixTimestamp
//
//
//let calendar = Calendar.current
//let year = calendar.component(.year, from: unixTimestamp)
//let month = calendar.component(.month, from: unixTimestamp)
//let day = calendar.component(.day, from: unixTimestamp)
//
//print(updatedTimeStamp)
//print("this is the Year: \(year), Month: \(month) and day: \(day)")
//
//
