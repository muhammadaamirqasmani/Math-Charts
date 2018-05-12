

//
//  TopicTVC.swift
//  EngineeringElectromagnatic
//
//  Created by Techsviewer on 07/04/2018.
//  Copyright © 2018 maqCloud. All rights reserved.
//

import UIKit

class TopicTVC: UITableViewCell {

    @IBOutlet weak var TopicTitle: UILabel!
//    @IBOutlet weak var TopicImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
class QuizTVC: UITableViewCell {
    
    @IBOutlet weak var QuizLbl: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
