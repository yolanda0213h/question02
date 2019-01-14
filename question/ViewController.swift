//
//  ViewController.swift
//  question
//
//  Created by Yolanda H. on 2019/1/8.
//  Copyright © 2019 Yolanda H. All rights reserved.
//

import UIKit
var star = ""
var score = 0
class ViewController: UIViewController {
    var index = 0
    @IBOutlet var pickings: [UIButton]!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var showButton: UIButton!
    @IBOutlet weak var showView: UIView!
    var questions = [question(descriptionText: "茶葉根據發酵程度可分為不發酵茶、部分發酵茶與全發酵茶，那麼不需要發酵製作工藝的茶葉是哪種？", answerText: "綠茶", chooseText:["紅茶","綠茶","黑茶"]),question(descriptionText: "咖啡樹適合成長在熱帶和亞熱帶氣候的地區，也就是位於南北迴歸線之間，以赤道為中心，約於北緯25度到南緯30度之間，並形成一個環狀地帶稱之為", answerText: "咖啡腰帶", chooseText:["咖啡赤道","咖啡歸線","咖啡腰帶"]),question(descriptionText: "那一個冷藏溫度比較適合新鮮果汁", answerText: "4℃", chooseText:["4℃","12℃","20℃"]),question(descriptionText: "使用個人式茶具沖泡茶葉時，3g的茶葉量，最好使用多少的水量為佳？", answerText: "150㏄", chooseText: ["100cc","120㏄","150㏄"]),question(descriptionText: "人的舌頭味覺分佈是", answerText: "舌尖甜兩邊酸舌根苦", chooseText: ["舌尖甜兩邊苦舌根酸","舌尖甜兩邊酸舌根苦","舌尖酸兩邊甜舌根苦"]),question(descriptionText: "下列那一種茶的維生素Ｃ含量最多？", answerText: "龍井綠茶", chooseText: ["茉莉花茶","菊花茶","龍井綠茶"]),question(descriptionText: "台灣氣候適宜種植茶樹，一年最多可採收幾次", answerText: "六次", chooseText: ["兩次","四次","六次"]),question(descriptionText: "依據CNS規定，製作冰淇淋至少應含有多少比例之鮮奶油乳脂肪", answerText: "8%", chooseText: ["4%","6%","8%"]),question(descriptionText: "鮮奶的飲料會發生凝結現象，是因為加入了含有什麼成份的食品", answerText: "酸性", chooseText: ["糖份","酸性","脂肪"]),question(descriptionText: "下列何物是略帶鹼性(不甜)的碳酸飲料", answerText: "蘇打水(Soda Water)", chooseText: ["薑汁汽水(Ginger Ale)","蘇打水(Soda Water)","萊姆汁(Lime Juice)"])]
    func showChoose() {
        pickings.shuffle()
        for i in 0 ..< pickings.count {
            pickings[i].setTitle(questions[index].choose[i], for: UIControl.State.normal)
            pickings[i].isEnabled = true
            pickings[i].backgroundColor = UIColor(displayP3Red: 0.9, green: 0.9, blue: 0.9, alpha: 0.9)
            pickings[i].setTitleColor(UIColor(displayP3Red: 0.1, green: 0.1, blue: 0.1, alpha: 1), for: UIControl.State.normal)
        }
        self.pickings[0].alpha = 0
        self.pickings[1].alpha = 0
        self.pickings[2].alpha = 0
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 1, delay: 1, animations: {
            self.pickings[0].alpha = 1
            self.pickings[1].alpha = 1
            self.pickings[2].alpha = 1
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        questions.shuffle()
        questionLabel.text = "第1題\n\n" + questions[0].description
        questionLabel.isHidden = false
        showChoose()
    }
    override func viewDidDisappear(_ animated: Bool) {
        questionLabel.text = ""
        answerLabel.text = ""
        showButton.alpha = 0
        for i in 0 ..< pickings.count {
            pickings[i].alpha = 0
        }
        
    }
    @IBAction func nextFunc(_ sender: UIButton) {
        index = index + 1
        if index == 3 {
            index = 0
            sender.setTitle("挑戰第二題", for: UIControl.State.normal)
            questions.shuffle()
            score = 0
            star = ""
        } else if index == 1 {
            sender.setTitle("挑戰最後一題", for: UIControl.State.normal)
        } else if index == 2 {
            sender.setTitle("重新挑戰", for: UIControl.State.normal)
            
        }
        questionLabel.text = "第" + String(index+1) + "題\n\n" + questions[index].description
        showChoose()
        answerLabel.isHidden = true
        answerLabel.text = ""
        sender.alpha = 0
        showButton.alpha = 0
    }
    
    
    @IBAction func picking3(_ sender: UIButton) {
        answerLabel.isHidden = false
        if sender.currentTitle == questions[index].answer{
            answerLabel.text = "答對了！"
            sender.backgroundColor = UIColor(displayP3Red: 0, green: 0.7, blue: 0, alpha: 0.9)
            score = score + 1
            star = star + " ⭐️ "
            if index == 2 {
                showButton.alpha = 1
                showButton.setTitle("我要摘星", for: UIControl.State.normal)
            }else{
                
            }
        }else{
            answerLabel.text = "答錯了！正確答案是\n\n" + questions[index].answer
            sender.backgroundColor = UIColor(displayP3Red: 0.7, green: 0, blue: 0, alpha: 0.9)
            if index == 2 {
                showButton.alpha = 1
                showButton.setTitle("我要摘星", for: UIControl.State.normal)
            }else{
                
            }
        }
        sender.setTitleColor(UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: 1), for: UIControl.State.normal)
        for i in 0 ..< pickings.count {
            pickings[i].isEnabled = false
        }
        nextButton.alpha = 1
    }
}

