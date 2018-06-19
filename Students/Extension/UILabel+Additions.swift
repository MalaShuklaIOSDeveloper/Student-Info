//
//  UILabel+Additions.swift
//  Students
//
//  Created by Ranjith Kumar on 6/10/18.
//  Copyright © 2018 DrawRect. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    convenience init(_ txt: String) {
        self.init()
        text = txt
        textColor = .lightGray
        sizeToFit()
        textAlignment = .center
    }
}
