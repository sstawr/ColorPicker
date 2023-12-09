//
//  ColorViewController.swift
//  ColorizedApp
//
//  Created by Evgeni Glushko on 9.12.23.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func setColor(_ color: UIColor)
}

final class ColorViewController: UIViewController {    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsVC = segue.destination as? SettingsViewController
        settingsVC?.viewColor = super.view.backgroundColor
        settingsVC?.delegate = self
    }
}

// MARK: - SettingsViewControllerDelegate
extension ColorViewController: SettingsViewControllerDelegate {
    func setColor(_ color: UIColor) {
        super.view.backgroundColor = color
    }
}
