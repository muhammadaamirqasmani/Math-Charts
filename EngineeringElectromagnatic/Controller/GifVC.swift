//
//  GifVC.swift
//  EngineeringElectromagnatic
//
//  Created by Nivedha Maran on 4/24/18.
//  Copyright © 2018 maqCloud. All rights reserved.
//

import UIKit

class GifVC: UIViewController {

    @IBOutlet weak var ImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ImageView.image = UIImage.gif(name: "gif")
        // Do any additional setup after loading the view.
    }

    

}
