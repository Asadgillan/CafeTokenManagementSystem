//
//  textfieldDesign.swift
//  HomeHealthCare
//
//  Created by Admin on 03/06/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

//  textviewDesign.swift
//  HomeHealthCare
//
//  Created by Admin on 03/06/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class textfieldDesign: UITextView{
    
    @IBInspectable var cornerRadius: CGFloat = 20
    
    
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 3
    @IBInspectable var shadowColor: UIColor? = UIColor.black
    
    @IBInspectable var shadowOpacity: Float = 0.5
    
    override func layoutSubviews() {
        
        layer.cornerRadius = cornerRadius
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        
        layer.masksToBounds = false
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
    }
    
}
