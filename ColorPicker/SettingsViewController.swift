//
//  ViewController.swift
//  ColorPicker
//
//  Created by Evgeni Glushko on 19.11.23.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var colorPanelView: UIView!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTF: UITextField!
    @IBOutlet var greenTF: UITextField!
    @IBOutlet var blueTF: UITextField!
    
    // MARK: - Public Properties
    weak var delegate: SettingsViewControllerDelegate?
    
    var viewColor: UIColor!
    
    // MARK: - Overrides Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        colorPanelView.layer.cornerRadius = 20
        
        colorPanelView.backgroundColor = viewColor
        
        setColorToSliders()
        
        redValueLabel.text = string(from: redSlider)
        greenValueLabel.text = string(from: greenSlider)
        blueValueLabel.text = string(from: blueSlider)
        
        redTF.text = string(from: redSlider)
        greenTF.text = string(from: greenSlider)
        blueTF.text = string(from: blueSlider)
        
        redTF.delegate = self
        greenTF.delegate = self
        blueTF.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - IB Actions
    @IBAction func sliderAction(_ sender: UISlider) {
        changeViewBackgroundColor()
        
        switch sender {
        case redSlider:
            redValueLabel.text = string(from: redSlider)
            redTF.text = string(from: redSlider)
        case greenSlider:
            greenValueLabel.text = string(from: greenSlider)
            greenTF.text = string(from: greenSlider)
        default:
            blueValueLabel.text = string(from: blueSlider)
            blueTF.text = string(from: blueSlider)
        }
    }
    
    @IBAction func doneButtonPressed() {
        delegate?.setColor(
            colorPanelView.backgroundColor ?? UIColor(
                red: 1,
                green: 1,
                blue: 1,
                alpha: 1
            )
        )
        dismiss(animated: true)
    }
    
    // MARK: - Private Methods
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
    
    private func showAlert(withTItle title: String, andMessage message: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            completion?()
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension Float {
    func cgFloat() -> CGFloat {
        CGFloat(self)
    }
}

// MARK: - UITextFieldDelegate
extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        let pattern = "^0(\\.\\d{1,2})?$|^1(\\.00)?$"
        let isDataValid = NSPredicate(format: "SELF MATCHES %@", pattern)
            .evaluate(with: textField.text)
        
        if !isDataValid {
            showAlert(
                withTItle: "Wrong data!",
                andMessage: "Please, enter correct data") {
                    textField.text = "0.50"
                }
            return
        }
        
        switch textField {
        case redTF:
            let redValue = Float(textField.text ?? "") ?? 0.0
            redSlider.setValue(redValue, animated: true)
            redValueLabel.text = string(from: redSlider)
        case greenTF:
            let greenValue = Float(textField.text ?? "") ?? 0.0
            greenSlider.setValue(greenValue, animated: true)
            greenValueLabel.text = string(from: greenSlider)
        default:
            let blueValue = Float(textField.text ?? "") ?? 0.0
            blueSlider.setValue(blueValue, animated: true)
            blueValueLabel.text = string(from: blueSlider)
        }
        
        changeViewBackgroundColor()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
