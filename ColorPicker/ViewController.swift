//
//  ViewController.swift
//  ColorPicker
//
//  Created by Evgeni Glushko on 19.11.23.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet var colorPanelView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorPanelView.layer.cornerRadius = 20
    }


}

