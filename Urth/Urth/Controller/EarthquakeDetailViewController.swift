//
//  EarthquakeInfoDisplay.swift
//  Urth
//
//  Created by Lerma, Ociel(AWF) on 12/8/19.
//  Copyright © 2019 Lerma, Ociel. All rights reserved.
//

import UIKit
import MapKit

class EarthquakeDetailView: UIViewController {
    
    //Map background
    let mapView : MKMapView  = {
        let map = MKMapView(frame: .zero)
        return map
    }()
    //Pin in the map with the Coordinate locations
    let cardInfo: InfoCardDetailView = {
        var cardInfo = InfoCardDetailView(frame: .zero)
        cardInfo.layer.cornerRadius = 15
        return cardInfo
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews(){
        view.addSubview(mapView)
        view.addSubview(cardInfo)
        mapView.anchor(top: view.topAnchor, leading: view.leadingAnchor,
                       bottom: view.bottomAnchor, trailing: view.trailingAnchor,
                       centerXaxis: nil, centerYaxis: nil)
        
        cardInfo.anchor(top: nil, leading: view.leadingAnchor,
                        bottom: view.safeAreaLayoutGuide.bottomAnchor,
                        trailing: view.trailingAnchor,
                        centerXaxis: nil, centerYaxis: nil,
                        padding: .init(top: 0, left: 40, bottom: 4, right: 40),
                        size: .init(width: 0, height: 200))
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
 
    
    
}
