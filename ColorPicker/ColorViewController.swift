//
//  ColorViewController.swift
//  ColorizedApp
//
//  Created by Evgeni Glushko on 9.12.23.
//

import UIKit

final class ColorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsVC = segue.destination as? SettingsViewController
        settingsVC?.viewColor = super.view.backgroundColor
    }
}
