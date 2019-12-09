//
//  DaysSlider.swift
//  Urth
//
//  Created by Lerma, Ociel(AWF) on 12/8/19.
//  Copyright © 2019 Lerma, Ociel. All rights reserved.
//

import UIKit

class DaysSlider: UISlider {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.tintColor = .white
        self.thumbTintColor = .black
        self.value = 15
        self.maximumValue = 30
        self.minimumValue = 1
        self.backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

class SearchOptionLabels: UILabel {
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = .black
        self.backgroundColor = .clear
        self.textAlignment = .center
        self.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SearchOptionTextFields: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.textColor = .black
        self.textAlignment = .center
        self.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
