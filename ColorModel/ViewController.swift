//
//  ViewController.swift
//  ColorModel
//
//  Created by Frederico Schnekenberg on 12/09/15.
//  Copyright (c) 2015 Misfit Rebels. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    //// MARK: - Properties
    var colorModel = Color()
    // -------------------------------------------------------------------------
    
    //// MARK: - IBOutlets
    @IBOutlet var colorView: ColorView!
    @IBOutlet var hueLabel: UILabel!
    @IBOutlet var saturationLabel: UILabel!
    @IBOutlet var brightnessLabel: UILabel!
    @IBOutlet var webLabel: UILabel!
    @IBOutlet var hueSlider: UISlider!
    @IBOutlet var saturationSlider: UISlider!
    @IBOutlet var brightnessSlider: UISlider!
    // -------------------------------------------------------------------------
    
    //// MARK: - IBActions
    @IBAction func changeHue(sender: AnyObject!)
    {
        if let slider = sender as? UISlider {
            colorModel.hue = slider.value
        }
    }
    
    @IBAction func changeSaturation(sender: AnyObject!)
    {
        if let slider = sender as? UISlider {
            colorModel.saturation = slider.value
        }
    }
    
    @IBAction func changeBrightness(sender: AnyObject!)
    {
        if let slider = sender as? UISlider {
            colorModel.brightness = slider.value
        }
    }
    // -------------------------------------------------------------------------
    
    //// MARK: - Key-Value Observing Function
    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>)
    {
        switch keyPath {
            case "hue":
                hueLabel.text = "\(Int(colorModel.hue))º"
                hueSlider.value = colorModel.hue
            case "saturation":
                saturationLabel.text = "\(Int(colorModel.saturation))%"
                saturationSlider.value = colorModel.saturation
            case "brightness":
                brightnessLabel.text = "\(Int(colorModel.brightness))%"
                brightnessSlider.value = colorModel.brightness
            case "color":
                colorView.setNeedsDisplay()
                var red: CGFloat = 0.0, green: CGFloat = 0.0, blue: CGFloat = 0.0, alpha: CGFloat = 0.0
                colorModel.color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
                webLabel.text = NSString(format: "#%02X%02X%02X", CInt(red*255), CInt(green*255), CInt(blue*255)) as String
            default:
                break
        }
    }
    // -------------------------------------------------------------------------
    
    //// MARK: - VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Key-Value Observers
        colorModel.addObserver(self, forKeyPath: "hue", options: .allZeros, context: nil)
        colorModel.addObserver(self, forKeyPath: "saturation", options: .allZeros, context: nil)
        colorModel.addObserver(self, forKeyPath: "brightness", options: .allZeros, context: nil)
        colorModel.addObserver(self, forKeyPath: "color", options: .allZeros, context: nil)
        // Each time one of these changes the controller will receive an observer call
        
        // Connects the ColorView to the data Model
        colorView.colorModel = colorModel
        
        // Sets the initial color values
        colorModel.hue = 60
        colorModel.saturation = 50
        colorModel.brightness = 100
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // -------------------------------------------------------------------------
}

