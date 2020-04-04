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
    
    @IBOutlet weak var contentTextView: UITextView!
    
    @IBOutlet weak var buttomButtonConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async {
            NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        }
    }
    
    @IBAction func onClickTtsPlay(_ sender: Any) {
        if let contectText = contentTextView.text {
            playTTS(message: contectText, rate: 0.4)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    func playTTS(message:String, rate:Float) {
        let synthesizer = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: message)
        utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
        utterance.rate = rate
        synthesizer.speak(utterance)
        
    }
}

extension TTSViewController: UITextViewDelegate {
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        //        guard let userInfo = notification.userInfo as? [String: Any] else { return }
        //        guard let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        //        guard userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber != nil else { return }
        //        let keyboardHeight = keyboardFrame.cgRectValue.height
        
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            print(self.buttomButtonConstraint.constant)
            print(keyboardHeight + 0)
            self.buttomButtonConstraint.constant -= keyboardHeight - 0
        }
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        self.buttomButtonConstraint.constant = 0
    }
}

