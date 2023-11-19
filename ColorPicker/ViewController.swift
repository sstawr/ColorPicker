//
//  ViewController.swift
//  ColorPicker
//
//  Created by Evgeni Glushko on 19.11.23.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet var colorPanelView: UIView!
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorPanelView.layer.cornerRadius = 20
        redValueLabel.text = redSlider.value.formatted()
        greenValueLabel.text = redSlider.value.formatted()
        blueValueLabel.text = redSlider.value.formatted()
        changeViewBackgroundColor()
    }
    
    @IBAction func redSliderAction() {
        redValueLabel.text = String(format: "%.2f", redSlider.value)
        changeViewBackgroundColor()
    }
    
    @IBAction func greenSliderAction() {
        greenValueLabel.text = String(format: "%.2f", greenSlider.value)
        changeViewBackgroundColor()
    }
    
    @IBAction func blueSliderAction() {
        blueValueLabel.text = String(format: "%.2f", blueSlider.value)
        changeViewBackgroundColor()
    }
    
    private func changeViewBackgroundColor() {
        colorPanelView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
}
