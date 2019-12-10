//
//  ActivityIndicator.swift
//  Urth
//
//  Created by Lerma, Ociel(AWF) on 12/10/19.
//  Copyright © 2019 Lerma, Ociel. All rights reserved.
//

import UIKit

class ActivityIndicator: UIActivityIndicatorView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.hidesWhenStopped = true
        self.style = .gray
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
