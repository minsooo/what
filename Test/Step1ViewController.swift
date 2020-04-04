//
//  Step1ViewController.swift
//  Test
//
//  Created by 1100480 on 2020/04/03.
//  Copyright © 2020 1100480. All rights reserved.
//

import UIKit
import AVFoundation

class Step1ViewController: UIViewController {

    @IBOutlet weak var actionButton: UIButton!
    
    var table : [String] = [
        "저리가",
        "신희우",
        "사라져",
        "뭐",
        "아니고",
        "그거 아냐",
        "한글자",
        "그게 아냐 아냐",
        "한",
        "글",
        "다 지워",
        "야",
        "아.. 아니",
        "니 얼굴",
        "으아아아ㅏ아ㅏ아",
        "야",
        "안",
        "돼",
        "아 진짜",
        "화장실에서",
        "지렸다",
        "한테",
        "면상에다",
        "주먹을",
        "현",
        "질",
        "시원해",
        "미안하다",
        "이거보여주려고",
        "어그로 끌었다",
        "긱블이",
        "나",
        "의",
        "마",
        "법",
        "의",
        "주문은",
        "으허",
        "멍",
        "청",
        "이",
        "멸",
        "치",
        "고자라니",
        "ㅋ",
        "ㅋ",
        "ㅋ",
        "으",
        "허",
        "헣",
        "ㅓ",
        "허",
        "헣",
        "나루토",
        "아",
        "이",
        "폰",
        "언",
        "제",
        "나오지",
        "그어",
        "어",
        "어",
        "억",
        "배",
        "그",
        "1",
        "등",
        "화",
        "난",
        "인간",
        "밥줘",
        "각",
        "수",
        "한",
        "짠",
        "자",
        "양자",
        "세계",
        "출",
        "발",
        "출발",
        "윤겔라",
        "얼",
        "굴",
        "뚱",
        "인",
        "데",
        "요",
        "뚱인데요",
        "그",
        "만",
        "해",
        "에잇",
        "내가"
    ]
    
    @IBOutlet weak var countLabel: UILabel!
    
    var clickCount : Int = 0
    var randomInt : Int = 0
    var savedText : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomInt = Int.random(in: 0..<table.count)
        actionButton.setTitle(table[randomInt], for: UIControl.State.normal)
    }
    
    @IBAction func onClick(_ sender: Any) {
        
        self.playTTS(message: table[randomInt], rate: 0.4)
        
        randomInt = Int.random(in: 0..<table.count)
        actionButton.setTitle(table[randomInt], for: UIControl.State.normal)
        
        let xPos = Int.random(in: 0..<Int(self.view.frame.size.width)-100)
        let yPos = Int.random(in: 100..<Int(self.view.frame.size.height)-100)
        
        actionButton.frame = CGRect(x: xPos, y:yPos, width: Int(actionButton.frame.size.width), height: Int(actionButton.frame.height))
        
        savedText = savedText + " " + table[randomInt]
        if(clickCount >= table.count) {
            clickCount = 0
            showPopup()
        } else {
            countLabel.text = String(clickCount)
            clickCount += 1
        }
        
    }
    
    func showPopup() {
        let dialog = UIAlertController(title: "이제 그만하자!", message: savedText, preferredStyle: .alert)
        let action = UIAlertAction(title: "알았음", style: UIAlertAction.Style.default)
        dialog.addAction(action)
        self.present(dialog, animated: true, completion: nil)
        
        self.playTTS(message: savedText, rate: 0.7)
        savedText = ""
    }
    
    func playTTS(message:String, rate:Float) {
        let synthesizer = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: message)
        utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
        utterance.rate = rate
        synthesizer.speak(utterance)
        
    }
}
