//
//  question.swift
//  question
//
//  Created by Yolanda H. on 2019/1/8.
//  Copyright © 2019 Yolanda H. All rights reserved.
//

import Foundation

class question {
    var description:String
    var answer:String
    var choose:[String]
    init(descriptionText:String, answerText:String, chooseText:[String]) {
        description = descriptionText
        answer = answerText
        choose = chooseText
    }
}

