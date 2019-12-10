//
//  EarthQuakeAPI.swift
//  Urth
//
//  Created by Lerma, Ociel(AWF) on 12/7/19.
//  Copyright © 2019 Lerma, Ociel. All rights reserved.

import Foundation

class  EarthquakeAPI {
    enum Endpoint: String {
        case allMonthEarthquakesURL = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.geojson"
        var url: URL {
            return URL(string: self.rawValue)!
        }
    }
    
    class func requestEarthquakeData(completionhandler: @escaping ([Feature]?, Error?) -> Void){
        let allEarthquakesURL = EarthquakeAPI.Endpoint.allMonthEarthquakesURL.url
        let task = URLSession.shared.dataTask(with: allEarthquakesURL) { (data, response, error) in
            guard let data = data else {
                completionhandler(nil, error)
                return
            }
            do {
                let EarthquakeData = try JSONDecoder().decode(Earthquake.self, from: data).features
                completionhandler(EarthquakeData, nil)
            }catch {
                completionhandler(nil, error)
                print(error)
            }
        }
        task.resume()
    }
}
