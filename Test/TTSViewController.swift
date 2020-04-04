//
//  TttsViewController.swift
//  Test
//
//  Created by SHINMIN SOO on 2020/04/04.
//  Copyright © 2020 1100480. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class TTSViewController: UIViewController {
    
    @IBOutlet weak var contentTextfield: UITextField!
    
    @IBAction func onClickTtsPlay(_ sender: Any) {
        if let contectText = contentTextfield.text {
            playTTS(message: contectText, rate: 0.4)
        }
    }
    
    func playTTS(message:String, rate:Float) {
        let synthesizer = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: message)
        utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
        utterance.rate = rate
        synthesizer.speak(utterance)
        
    }
}
