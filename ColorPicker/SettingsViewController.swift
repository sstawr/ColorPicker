//
//  ViewController.swift
//  ColorPicker
//
//  Created by Evgeni Glushko on 19.11.23.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    @IBOutlet var colorPanelView: UIView!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    var viewColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorPanelView.layer.cornerRadius = 20
        
        colorPanelView.backgroundColor = viewColor
        
        setColorToSliders()
        
        redValueLabel.text = string(from: redSlider)
        greenValueLabel.text = string(from: greenSlider)
        blueValueLabel.text = string(from: blueSlider)
        
        //changeViewBackgroundColor()
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        changeViewBackgroundColor()
        
        switch sender {
        case redSlider:
            redValueLabel.text = string(from: redSlider)
        case greenSlider:
            greenValueLabel.text = string(from: greenSlider)
        default:
            blueValueLabel.text = string(from: blueSlider)
        }
    }
    
    private func changeViewBackgroundColor() {
        colorPanelView.backgroundColor = UIColor(
            red: redSlider.value.cgFloat(),
            green: greenSlider.value.cgFloat(),
            blue: blueSlider.value.cgFloat(),
            alpha: 1
        )
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func setColorToSliders() {
        let redValue = colorPanelView.backgroundColor?.cgColor.components?[0] ?? 0
        let greenValue = colorPanelView.backgroundColor?.cgColor.components?[1] ?? 0
        let blueValue = colorPanelView.backgroundColor?.cgColor.components?[2] ?? 0
        
        redSlider.value = Float(CGFloat(redValue))
        greenSlider.value = Float(CGFloat(greenValue))
        blueSlider.value = Float(CGFloat(blueValue))
    }
}

extension Float {
    func cgFloat() -> CGFloat {
        CGFloat(self)
    }
}
