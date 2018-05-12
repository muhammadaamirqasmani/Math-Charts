//
//  ObjectsStructure.swift
//  EngineeringElectromagnatic
//
//  Created by Techsviewer on 07/04/2018.
//  Copyright © 2018 maqCloud. All rights reserved.
//

import Foundation
import UIKit

struct TopicObj {
    var topicTitle: String
    var TopicTitelImage: UIImage
    var topicImages: [UIImage]
    var content: String
    init(topicTitle:String, topicImage:[UIImage],TopicTitelImage: UIImage, content: String) {
        self.topicImages = topicImage
        self.topicTitle = topicTitle
        self.TopicTitelImage = TopicTitelImage
        self.content = content
    }
}
struct Quiz {
    var Question: String
    var Ans: [String]
    var CorrectAns: String
    init(Question:String, Ans:[String],CorrectAns:String) {
        self.Question = Question
        self.Ans = Ans
        self.CorrectAns = CorrectAns
    }
}
