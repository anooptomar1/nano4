//
//  StartViewController.swift
//  nano4
//
//  Created by Rafael Zabotini on 21/02/18.
//  Copyright © 2018 @ Rafael Zabotini. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    @IBOutlet weak var lastSearchButton: UIButton!
    @IBOutlet weak var onboardView: UIView!
    @IBOutlet weak var objectNameLabel: UILabel!
    
    @IBAction func onboardButton(_ sender: Any) {
        UIView.animate(withDuration: 1.0, animations: {
            self.onboardView.isHidden = true
        }, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (UserDefaults.standard.string(forKey: "objectName") == nil) {
            onboardView.isHidden = false
            lastSearchButton.isHidden = true
        }
        
        if (UserDefaults.standard.string(forKey: "objectName") != nil) {
            objectNameLabel.text = UserDefaults.standard.string(forKey: "objectName")
        } else {
            objectNameLabel.text = "No object recognized yet"
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if (UserDefaults.standard.string(forKey: "objectName") != nil) {
            objectNameLabel.text = UserDefaults.standard.string(forKey: "objectName")
            lastSearchButton.isHidden = false
            lastSearchButton.setTitle("Search for \(UserDefaults.standard.string(forKey: "objectName") ?? "recognized object") near",for: .normal)
        }
    }
    
    
}
