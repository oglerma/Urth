//
//  Earthquake.swift
//  Urth
//
//  Created by Lerma, Ociel(AWF) on 12/7/19.
//  Copyright © 2019 Lerma, Ociel. All rights reserved.
//

import Foundation

// MARK: - Earthquake (Main)
struct Earthquake: Codable {
    let type: String?
    let metadata: Metadata?
    let features: [Feature]
    let bbox: [Double]?
    
}

// MARK: - Metadata
struct Metadata: Codable {
    let generated: Int
    let url: String
    let title: String
    let status: Int
    let api: String
    let count: Int
}


// MARK: - Feature
struct Feature: Codable {
    let type: String
    let properties: Properties
    let geometry: Geometry
    let id: String?
}

// MARK: - Properties
struct Properties: Codable {
    let mag: Double?
    let place: String?
    let time, updated: Int?
    let tz: Int?
    let url: String?
    let detail: String?
    let felt: Int?
    let cdi, mmi: Double?
    let alert: String?
    let status: String?
    let tsunami, sig: Int?
    let net: String?
    let code, ids: String?
    let sources: String?
    let types: String?
    let nst: Int?
    let dmin: Double?
    let rms: Double
    let gap: Double?
    let magType: String?
    let type: String?
    let title: String?

}

// MARK: - Geometry
struct Geometry: Codable {
    let type: String
    let coordinates: [Double]
}

