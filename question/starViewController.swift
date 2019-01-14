//
//  starViewController.swift
//  question
//
//  Created by Yolanda H. on 2019/1/14.
//  Copyright © 2019 Yolanda H. All rights reserved.
//

import UIKit

class starViewController: UIViewController {

    @IBOutlet weak var starLabel: UILabel!
    @IBOutlet weak var textButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.starLabel.alpha = 0
        self.starLabel.frame.origin.y = 0
        self.textButton.alpha = 0
        self.textButton.frame.origin.y = 600
        self.starLabel.transform = CGAffineTransform(rotationAngle: -CGFloat.pi )
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 3, delay: 0, animations: {
            self.starLabel.alpha = 1
            self.starLabel.frame.origin.y = 260
            self.textButton.alpha = 1
            self.textButton.frame.origin.y = 360
            self.starLabel.transform = CGAffineTransform(rotationAngle: 0 )
        }, completion: nil)
        textButton.setTitle("你得到了" + String(score) + "顆星", for: UIControl.State.normal)
        starLabel.text = star
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
