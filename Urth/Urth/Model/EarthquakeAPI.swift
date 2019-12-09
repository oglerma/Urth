//
//  EarthQuakeAPI.swift
//  Urth
//
//  Created by Lerma, Ociel(AWF) on 12/7/19.
//  Copyright © 2019 Lerma, Ociel. All rights reserved.
//

import Foundation

class  EarthquakeAPI {
    enum Endpoint: String {
        case overFourMagnitudeURL = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/4.5_month.geojson"
        case overFourPastDayURL = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/4.5_day.geojson"
        case overFourPastWeekURL = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/4.5_week.geojson"
        case overFourOneHourAgoURL = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/4.5_hour.geojson"
        case allMonthEarthQuakesURL = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.geojson"
        case oneWeekEarthquakeURL = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/1.0_week.geojson"
        
        var url: URL {
            return URL(string: self.rawValue)!
        }
    }
    
    class func requestEarthquakeData(magnitude: Double,
                                     country: String, daysAgo: Int,
                                     completionhandler: @escaping ([Feature]?, Error?) -> Void){
        
        let topEarthQuakesURL = EarthquakeAPI.Endpoint.oneWeekEarthquakeURL.url
        let task = URLSession.shared.dataTask(with: topEarthQuakesURL) { (data, response, error) in
            guard let data = data else {
                completionhandler(nil, error)
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let EarthquakeData = try decoder.decode(Earthquake.self, from: data).features
                completionhandler(EarthquakeData, nil)
            }catch {
                print(error)
            }
            
            
            
        }
        
        task.resume()
    }

}
