//
//  ViewController.swift
//  COVID19inData
//
//  Created by Carlos Barraza on 07/01/21.
//

import UIKit
import Foundation

class LaunchScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func startButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "CountryListSegue", sender: self)
    }

}
