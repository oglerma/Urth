//
//  TopCountriesCell.swift
//  Urth
//
//  Created by Lerma, Ociel(AWF) on 12/6/19.
//  Copyright © 2019 Lerma, Ociel. All rights reserved.
//

import UIKit

class EarthquakeCell: UITableViewCell {

    let place: UILabel = {
        let lbl = UILabel(frame: .zero)
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 12)
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(place)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
