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
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
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
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 10)
        return lbl
    }()
    
    lazy var infoStackView: UIStackView = {
        var stk = UIStackView(arrangedSubviews: [place,dateDisplayed])
        stk.axis = .vertical
        stk.distribution = .fillEqually
        return stk
    }()
    
    let cellView: UIView = {
        let c = UIView()
        c.layer.cornerRadius = 5
        c.layer.borderWidth = 1
        c.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        c.backgroundColor = #colorLiteral(red: 0.7185817957, green: 0.4743951559, blue: 0.2656674683, alpha: 1)
        c.clipsToBounds = true
        return c
    }()
    
    func setupView(){
        clipsToBounds = true
        selectionStyle = .none
        addSubview(cellView)
        cellView.addSubview(infoStackView)
        cellView.addSubview(magnitude)
        cellView.setShadow()
        
        cellView.anchor(top: topAnchor, leading: leadingAnchor,
                        bottom: bottomAnchor, trailing: trailingAnchor,
                        centerXaxis: nil, centerYaxis: nil,
                        padding: .init(top: 4, left: 8, bottom: 4, right: 8))
        
        infoStackView.anchor(top: cellView.topAnchor, leading: cellView.leadingAnchor,
                             bottom: cellView.bottomAnchor, trailing: cellView.trailingAnchor,
                             centerXaxis: nil, centerYaxis: nil)

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
