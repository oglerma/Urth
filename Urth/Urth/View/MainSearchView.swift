//
//  MainSearchView.swift
//  Urth
//
//  Created by Lerma, Ociel(AWF) on 12/7/19.
//  Copyright © 2019 Lerma, Ociel. All rights reserved.
//

import UIKit
class MainSearchView: UIView {
    
    var selectedDay: String?
    
    // Country UI
    let countryTextLabel: UILabel = {
        let cntrytxt = UILabel()
        cntrytxt.text =  "Country"
        cntrytxt.textColor = .black
        cntrytxt.backgroundColor = .clear
        cntrytxt.textAlignment = .center
        cntrytxt.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        cntrytxt.accessibilityIdentifier = "country_text"
       return cntrytxt
    }()
    
    let countryTxtView: UILabel = {
        let txt = UILabel()
        txt.text = "Select a country"
        txt.backgroundColor = .clear
        txt.textColor = .black
        txt.textAlignment = .center
        txt.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        txt.layer.cornerRadius = 5
        txt.layer.borderWidth = 1
        txt.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        txt.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        return txt
    }()
    
    // Magnitude UI
    let magnitudeTxtLabel: UILabel = {
        let magnitudeTxt = UILabel()
        magnitudeTxt.text =  "Magnitude"
        magnitudeTxt.textColor = .black
        magnitudeTxt.backgroundColor = .clear
        magnitudeTxt.textAlignment = .center
        magnitudeTxt.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return magnitudeTxt
    }()
    
    let magnitudeTxtView: UILabel = {
        let txt = UILabel()
        txt.text = "Select Magnitude"
        txt.backgroundColor = .clear
        txt.textColor = .black
        txt.textAlignment = .center
        txt.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        txt.layer.cornerRadius = 5
        txt.layer.borderWidth = 1
        txt.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return txt
    }()
    
    // Days UI
    let askForDaysTxtLabel: UILabel = {
        let askForDaysTxtLabel = UILabel()
        askForDaysTxtLabel.text =  "Select past days: "
        askForDaysTxtLabel.textColor = .black
        askForDaysTxtLabel.backgroundColor = .clear
        askForDaysTxtLabel.textAlignment = .center
        askForDaysTxtLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return askForDaysTxtLabel
    }()

    var daySelectedTextView: UILabel = {
        let daySelected = UILabel()
        daySelected.backgroundColor = .clear
        daySelected.textAlignment = .center
        daySelected.textColor = .black
        daySelected.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return daySelected
    }()
    
    let slider: DaysSlider = {
        let slider = DaysSlider(frame: .zero)
        slider.backgroundColor = .clear
        slider.addTarget(self, action: #selector(slidingInProgress(slider:)), for: .valueChanged)
        return slider
    }()
    @objc func slidingInProgress(slider: UISlider){
        let days = Int(slider.value)
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
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        self.setNeedsLayout()
        let width = self.frame.width
        let heigth = self.frame.height
        
        print("This is width \(width)and height:\(heigth)" )
        setupViews()
        createPicker()
        
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
    
    func createPicker(){
        let picker = UIPickerView()
        picker.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        askForDaysTxtLabel.text = selectedDay
    }
    
}


struct SearchSelctionModel {
    static let days = [1,7,15, 30]
    static let listOfAllCountries = [""]
    static let magnitudeValues = [1, 2, 3, 4, 5]
}

