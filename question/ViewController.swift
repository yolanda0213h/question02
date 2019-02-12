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
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var noanswerButton: UIButton!
    @IBOutlet weak var textfieldContent: UITextField!
    @IBOutlet var pickings: [UIButton]!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var showView: UIView!
var questions = [question(descriptionText: "新的一年是己亥年，又稱哪一個“生肖年”？", answerText: "豬年", chooseText:["雞年","豬年","魚年"]),question(descriptionText: "新年吉祥花卉「金盞銀臺」，指的是什麼花？", answerText: "水仙花", chooseText:["銀柳","水仙花","牡丹花"]),question(descriptionText: "傳統初五開工是因為迎接哪個神的生日？", answerText: "財神", chooseText:["灶神","宅神","財神"]),question(descriptionText: "過年要吃長年菜，在台灣中北部吃的是芥菜，在南部吃的是什麼菜？", answerText: "菠菜", chooseText: ["菠菜","韭菜","香菜"]),question(descriptionText: "初三睡到飽，這天又稱為”什麼日“？", answerText: "赤狗日", chooseText: ["赤狗日","白虎日","朱雀日"]),question(descriptionText: "玉皇大帝生日是初幾？", answerText: "初九", chooseText: ["初六","初九","初八"]),question(descriptionText: "春節的最後一天是上元節，這天是正月幾號？", answerText: "十五", chooseText: ["十五","十二","三十"]),question(descriptionText: "和尚撐傘（猜一成語）", answerText: "無法無天", chooseText: ["法海無邊","一手遮天","無法無天"]),question(descriptionText: "一顆心值多少錢？（跟成語有關）", answerText: "一億", chooseText: ["一億","八億","一元"]),question(descriptionText: "正月沒有初一（猜一字）", answerText: "肯", chooseText: ["口","肯","丹"])]
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
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 1, delay: 0, animations: {
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
        pickings[0].alpha = 0
        pickings[1].alpha = 0
        pickings[2].alpha = 0
    }
    override func viewDidDisappear(_ animated: Bool) {
        questionLabel.text = ""
        answerLabel.text = ""
        for i in 0 ..< pickings.count {
            pickings[i].alpha = 0
        }
        
    }
    @IBAction func showchoose(_ sender: UIButton) {
        sendButton.alpha = 1
        if sender.currentTitle == "提示1次" {
            showChoose()
            sender.backgroundColor = UIColor(displayP3Red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
            sender.setTitleColor(UIColor.white, for: UIControl.State.normal)
            sender.setTitle("提示用盡", for: UIControl.State.normal)
        }else if sender.currentTitle == "放棄"{
            answerLabel.isHidden = false
            answerLabel.text = "正確答案是\n\n" + questions[index].answer
            answerLabel.textColor = UIColor.yellow
            for i in 0 ..< pickings.count {
                pickings[i].isEnabled = false
            }
            nextButton.alpha = 1
        }
        
    }
    @IBAction func nextFunc(_ sender: UIButton) {
        
        index = index + 1
        if index == 3 {
            index = 0
            sendButton.alpha = 0
            sender.setTitle("挑戰第二題", for: UIControl.State.normal)
            questions.shuffle()
            score = 0
            star = ""
            sendButton.isEnabled = true
            noanswerButton.setTitle("提示1次", for: UIControl.State.normal)
            noanswerButton.backgroundColor = UIColor.yellow
            noanswerButton.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        } else if index == 1 {
            sender.setTitle("挑戰最後一題", for: UIControl.State.normal)
            if noanswerButton.currentTitle == "提示用盡" {
                noanswerButton.setTitle("放棄", for: UIControl.State.normal)
            }
        } else if index == 2 {
            sender.setTitle("重新挑戰", for: UIControl.State.normal)
            if noanswerButton.currentTitle == "提示用盡" {
                noanswerButton.setTitle("放棄", for: UIControl.State.normal)
            }
        }
        questionLabel.text = "第" + String(index+1) + "題\n\n" + questions[index].description
        answerLabel.isHidden = true
        answerLabel.text = ""
        pickings[0].alpha = 0
        pickings[1].alpha = 0
        pickings[2].alpha = 0
        textfieldContent.text = ""
        sender.alpha = 0
        sendButton.alpha = 0
    }
    @IBAction func didendonexit(_ sender: UITextField) {
        if sender.text == "" {
            sendButton.alpha = 0
        }else{
            sendButton.alpha = 1
        }
    }
    @IBAction func showanswer(_ sender: UIButton) {
        
        pickings[0].alpha = 0
        pickings[1].alpha = 0
        pickings[2].alpha = 0
        if textfieldContent.text == "" {
            answerLabel.isHidden = false
            answerLabel.text = "請輸入答案"
            answerLabel.textColor = UIColor.yellow
         } else {
            sender.isEnabled = true
            answerLabel.isHidden = false
            if textfieldContent.text == questions[index].answer {
                answerLabel.text = "答對了！"
                answerLabel.textColor = UIColor.green
            }else {
                answerLabel.text = "答錯了！\n\n正確答案是\n\n" + questions[index].answer
                answerLabel.textColor = UIColor.yellow
            }
            for i in 0 ..< pickings.count {
                pickings[i].isEnabled = false
            }
            nextButton.alpha = 1
        }
    }
    @IBAction func picking3(_ sender: UIButton) {
        textfieldContent.text = sender.currentTitle
    }
}

