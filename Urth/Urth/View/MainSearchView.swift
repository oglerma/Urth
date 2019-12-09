//
//  MainSearchView.swift
//  Urth
//
//  Created by Lerma, Ociel(AWF) on 12/7/19.
//  Copyright © 2019 Lerma, Ociel. All rights reserved.
//

import UIKit

protocol SearchDelegate {
    func searchTapped(day: Int, country: String, magnitude: Int)
}

protocol PickerDelegate {
    func pickerSelected()
}

class MainSearchView: UIView {
    
    var selectedDay = 0
    var selectedCountry = ""
    var selectedMagnitude = 0
    var searchDelegate: SearchDelegate!
    let firstPicker =  UIPickerView()
    let secondPicker = UIPickerView()
    
    // Country UI
    let countryTextLabel: SearchOptionLabels = {
        let cntrytxt = SearchOptionLabels()
        cntrytxt.text =  "Country"
        cntrytxt.accessibilityIdentifier = "country_txt_label"
       return cntrytxt
    }()
    
    let countryTxtView: SearchOptionTextFields = {
        let txt = SearchOptionTextFields()
        txt.text = "Select a country"
        txt.accessibilityIdentifier = "country_txtview"
        return txt
    }()
    
    
    // Magnitude UI
    let magnitudeTxtLabel: SearchOptionLabels = {
        let magnitudeTxt = SearchOptionLabels()
        magnitudeTxt.text =  "Magnitude"
        magnitudeTxt.accessibilityIdentifier = "magnitude_txt_lbl"
        return magnitudeTxt
    }()
    
    let magnitudeTxtView: SearchOptionTextFields = {
        let txt = SearchOptionTextFields()
        txt.text = "Select Magnitude"
        txt.accessibilityIdentifier = "magnitude_txtview"
        return txt
    }()
    

    
    // Days UI
    let askForDaysTxtLabel: SearchOptionLabels = {
        let askForDaysTxtLabel = SearchOptionLabels()
        askForDaysTxtLabel.text =  "Select past days: "
        askForDaysTxtLabel.accessibilityIdentifier = "days_txt_lbl"
        return askForDaysTxtLabel
    }()

    var daySelectedTextView: SearchOptionLabels = {
        let daySelected = SearchOptionLabels()
        daySelected.accessibilityIdentifier = "days_txtview"
        return daySelected
    }()
    
    let slider: DaysSlider = {
        let slider = DaysSlider(frame: .zero)
        slider.addTarget(self, action: #selector(slidingInProgress(slider:)), for: .valueChanged)
        slider.accessibilityIdentifier = "slider_id"
        return slider
    }()
    @objc func slidingInProgress(slider: UISlider){
        let days = Int(slider.value)
        selectedDay = days
        if days == 1 {
            daySelectedTextView.text = "\(days) day back"
        }else {
            daySelectedTextView.text = "\(days) days back"
        }
        
    }
    
    lazy var labelsStackView: UIStackView = {
        let stk = UIStackView(arrangedSubviews: [countryTextLabel,magnitudeTxtLabel])
        stk.translatesAutoresizingMaskIntoConstraints = false
        stk.axis = .horizontal
        stk.spacing = 20
        stk.distribution = .fillEqually
        stk.backgroundColor = .black
        return stk
    }()
    
    lazy var textStackView: UIStackView = {
        let stk = UIStackView(arrangedSubviews: [countryTxtView,magnitudeTxtView])
        stk.translatesAutoresizingMaskIntoConstraints = false
        stk.axis = .horizontal
        stk.spacing = 20
        stk.distribution = .fillEqually
        stk.backgroundColor = .black
        return stk
    }()
    
    lazy var sliderStackViewOptions: UIStackView = {
        let stk = UIStackView(arrangedSubviews: [askForDaysTxtLabel,daySelectedTextView])
        stk.translatesAutoresizingMaskIntoConstraints = false
        stk.axis = .horizontal
        stk.spacing = 5
        stk.distribution = .fillEqually
        stk.backgroundColor = .black
        return stk
    }()
    
    lazy var searchStackView: UIStackView = {
        let stk = UIStackView(arrangedSubviews: [slider,searchBtn])
        stk.translatesAutoresizingMaskIntoConstraints = false
        stk.axis = .horizontal
        stk.spacing = 5
        stk.distribution = .fillEqually
        stk.backgroundColor = .black
        return stk
    }()
    
    let searchBtn : UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitleColor(.black, for: .normal)
        btn.setTitle("Search", for: .normal)
        btn.addTarget(self, action: #selector(searchTapped), for: .touchUpInside)
        return btn
    }()
    
    @objc func searchTapped(){
        searchDelegate.searchTapped(day: selectedDay, country: selectedCountry, magnitude: selectedMagnitude)
    }
    


    func setupViews(){
        backgroundColor = #colorLiteral(red: 0.4102995396, green: 0.6531198621, blue: 0.2377773523, alpha: 1)
        addSubview(labelsStackView)
        addSubview(textStackView)
        addSubview(sliderStackViewOptions)
        addSubview(searchStackView)

        labelsStackView.anchor(top: topAnchor, leading: leadingAnchor,
                               bottom: nil, trailing: trailingAnchor,
                               centerXaxis: nil, centerYaxis: nil,
                               padding: .init(top: 4, left: 4, bottom: 0, right: 4),
                               size: .init(width: 0, height: 25))

        textStackView.anchor(top: labelsStackView.bottomAnchor, leading:labelsStackView.leadingAnchor,
                               bottom: nil, trailing: labelsStackView.trailingAnchor,
                               centerXaxis: nil, centerYaxis: nil,
                               padding: .init(top: 4, left: 4, bottom: 0, right: 4),
                               size: .init(width: 0, height: 25))
        sliderStackViewOptions.anchor(top: textStackView.bottomAnchor, leading: textStackView.leadingAnchor,
                                      bottom: nil, trailing: textStackView.trailingAnchor,
                                      centerXaxis: nil, centerYaxis: nil,
                                      padding: .init(top: 4, left: 4, bottom: 0, right: 4),
                                      size: .init(width: 0, height: 25))
        
        searchStackView.anchor(top: sliderStackViewOptions.bottomAnchor, leading: sliderStackViewOptions.leadingAnchor,
                                      bottom: bottomAnchor, trailing: sliderStackViewOptions.trailingAnchor,
                                      centerXaxis: nil, centerYaxis: nil)



    }

    /*******************************************************
     * Picker
     *******************************************************/
    func createPicker(){
        firstPicker.delegate = self
        secondPicker.delegate = self
        countryTxtView.inputView = firstPicker
        magnitudeTxtView.inputView = secondPicker
    }
    
    func createToolBar(){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(dissmissKeyboard))
        toolbar.setItems([doneBtn], animated: true)
        toolbar.isUserInteractionEnabled = true
        
        countryTxtView.inputAccessoryView = toolbar
        magnitudeTxtView.inputAccessoryView = toolbar
    }
    
    @objc func dissmissKeyboard(){
        self.endEditing(true)
    }
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        createPicker()
        createToolBar()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


/*******************************************************
 * PICKER EXTENSION
 *******************************************************/
extension MainSearchView: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

        if firstPicker == pickerView {
            return PickerData.listOfAllCountries.count
        }else {
            return PickerData.magnitudeValues.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        

        if firstPicker == pickerView {
            return PickerData.listOfAllCountries[row]
        }else {
            return "\(PickerData.magnitudeValues[row])+ mag"
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if firstPicker == pickerView {
            countryTxtView.text = PickerData.listOfAllCountries[row]
            selectedCountry = PickerData.listOfAllCountries[row]
        }else {
            magnitudeTxtView.text = "\(PickerData.magnitudeValues[row])+ mag"
            selectedMagnitude = PickerData.magnitudeValues[row]
        }
    }
    
}



struct PickerData {
    static let listOfAllCountries = ["Asia", "North", "West"]
    static let magnitudeValues = [1, 2, 3, 4, 5]
}


