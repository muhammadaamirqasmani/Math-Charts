//
//  GifVController.swift
//  EngineeringElectromagnatic
//
//  Created by Nivedha Maran on 4/24/18.
//  Copyright © 2018 maqCloud. All rights reserved.
//

import UIKit

class GifVController: UIViewController {

    @IBOutlet weak var ImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if gif == "Gauss's Law"{
          self.ImageView.image = UIImage.gif(name: "gausslaw")
        }else {
        self.ImageView.image = UIImage.gif(name: "Circular Polarisation")
        // Do any additional setup after loading the view.
        }
        }
}
