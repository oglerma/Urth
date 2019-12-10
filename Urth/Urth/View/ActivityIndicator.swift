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
        self.style = .whiteLarge
        self.color = #colorLiteral(red: 0.4020084143, green: 0.689712584, blue: 0.1968233883, alpha: 1)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
