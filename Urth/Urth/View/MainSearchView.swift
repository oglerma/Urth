//
//  MainSearchView.swift
//  Urth
//
//  Created by Lerma, Ociel(AWF) on 12/7/19.
//  Copyright © 2019 Lerma, Ociel. All rights reserved.
//

import UIKit
class MainSearchView: UIView {
    
    let countryTxtView: UITextView = {
        let txt = UITextView()
        return txt
    }()
    
    let magnitudedTxtView: UITextView = {
        let txt = UITextView()
        return txt
    }()
    
    let numberOfDaysAgoTxtView: UITextView = {
        let txt = UITextView()
        txt.text = "Select the number of days back you want to see"
        txt.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        txt.textColor = .black
        txt.textAlignment = .center
        return txt
    }()
    
    var selectedDay: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        setupViews()
        createPicker()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        addSubview(numberOfDaysAgoTxtView)
        numberOfDaysAgoTxtView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, centerXaxis: nil, centerYaxis: nil,size: .init(width: 0, height: 30))
        
    }
    
    func createPicker(){
        let picker = UIPickerView()
        picker.delegate = self
        numberOfDaysAgoTxtView.inputView = picker
    }
}

extension MainSearchView: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return SearchSelctionModel.days.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(SearchSelctionModel.days[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedDay = String(SearchSelctionModel.days[row])
        numberOfDaysAgoTxtView.text = selectedDay
    }
    
}


struct SearchSelctionModel {
    static let days = [1,7,15, 30]
    static let listOfAllCountries = [""]
    static let magnitudeValues = [1, 2, 3, 4, 5]
}
