//
//  EarthquakeInfoDisplay.swift
//  Urth
//
//  Created by Lerma, Ociel(AWF) on 12/8/19.
//  Copyright © 2019 Lerma, Ociel. All rights reserved.
//

import UIKit
import MapKit

class EarthquakeDetailViewController: UIViewController, MKMapViewDelegate {
    
    let mapView : MKMapView  = {
        let map = MKMapView(frame: .zero)
        return map
    }()
    let cardInfo: InfoCardDetailView = {
        var cardInfo = InfoCardDetailView(frame: .zero)
        cardInfo.layer.cornerRadius = 15
        cardInfo.layer.borderWidth = 1
        cardInfo.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return cardInfo
    }()
    
    var coordinates: [Double] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        createAnnotationInTheMap()
    }
    
    
    func createAnnotationInTheMap(){
        mapView.delegate = self
        let epicenter = MKPointAnnotation()
        epicenter.title = "Epicenter"
        epicenter.coordinate = CLLocationCoordinate2D(latitude: coordinates[1], longitude: coordinates[0])
        mapView.addAnnotation(epicenter)
        mapView.showAnnotations(self.mapView.annotations, animated: true)
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
                        padding: .init(top: 0, left: 80, bottom: 10, right: 80),
                        size: .init(width: 0, height: 100))
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

}
