//
//  ViewController.swift
//  Test
//
//  Created by 1100480 on 2020/04/03.
//  Copyright © 2020 1100480. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onClick(_ sender: Any) {
        let dialog = UIAlertController(title: "누르지 말라고!", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "알았음", style: UIAlertAction.Style.default)
        dialog.addAction(action)
        self.present(dialog, animated: true, completion: nil)
        
        AudioServicesPlaySystemSound(1015)

    
    }
}

