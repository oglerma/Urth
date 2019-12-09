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
        lbl.backgroundColor = .yellow
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 24)
        return lbl
    }()
    
    let magnitude: UILabel = {
        let lbl = UILabel(frame: .zero)
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.backgroundColor = #colorLiteral(red: 1, green: 0.2698713541, blue: 0.2734055519, alpha: 1)
        lbl.font = UIFont.boldSystemFont(ofSize: 12)
        lbl.clipsToBounds = true
        return lbl
    }()
    
    let dateDisplayed: UILabel = {
        let lbl = UILabel(frame: .zero)
        lbl.textColor = .black
        lbl.backgroundColor = .yellow
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 12)
        return lbl
    }()
    
    
    let cellView: UIView = {
        let c = UIView()
        c.layer.cornerRadius = 5
        c.layer.borderWidth = 1
        c.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return c
    }()
    
    func setupView(){
        addSubview(cellView)
        cellView.addSubview(place)
        cellView.addSubview(magnitude)
        cellView.anchor(top: topAnchor, leading: leadingAnchor,
                        bottom: bottomAnchor, trailing: trailingAnchor,
                        centerXaxis: nil, centerYaxis: nil,
                        padding: .init(top: 4, left: 8, bottom: 4, right: 8))
        
        place.anchor(top: cellView.topAnchor, leading: cellView.leadingAnchor,
                         bottom: cellView.bottomAnchor, trailing: nil,
                         centerXaxis: nil, centerYaxis: nil,
                         padding: .init(top: 4, left: 4, bottom: 4, right: 0),
                         size: .init(width: 200, height: 0))
        magnitude.anchor(top: nil, leading: nil,
                         bottom: cellView.bottomAnchor, trailing: cellView.trailingAnchor,
                         centerXaxis: nil, centerYaxis: nil,
                         padding: .init(top: 0, left: 0, bottom: 5, right: 5),
                         size: .init(width: 30, height: 20))
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
