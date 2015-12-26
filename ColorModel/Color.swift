//
//  Color.swift
//  ColorModel
//
//  Created by Frederico Schnekenberg on 12/09/15.
//  Copyright (c) 2015 Misfit Rebels. All rights reserved.
//

import UIKit

class Color : NSObject
{
    //// MARK: - Properties
    dynamic var hue: Float = 0.0            // Hue angle (degrees, 0..360)
    dynamic var saturation: Float = 0.0     // Saturation (percent, 0..100)
    dynamic var brightness: Float = 0.0     // Brightness (percent, 0..100)
    // -------------------------------------------------------------------------
    
    //// MARK: - Computed Property
    var color: UIColor {
        return UIColor(hue: CGFloat(hue/360),
                saturation: CGFloat(saturation/100),
                brightness: CGFloat(brightness/100),
                alpha: 1.0
        )
    } // Returns a UIColor object equivalent to this color
    // -------------------------------------------------------------------------
    
    //// MARK: - KVO Class Function
    class func keyPathsForValuesAffectingColor() -> NSSet
    {
        return NSSet(array: ["hue", "saturation", "brightness"])
    }
    // -------------------------------------------------------------------------
    // TODO: Check out Key-Value Observing Programming Guide
}