//
//  EETabBarVC.swift
//  EngineeringElectromagnatic
//
//  Created by Techsviewer on 11/05/2018.
//  Copyright © 2018 maqCloud. All rights reserved.
//

import UIKit

class EETabBarVC: UITabBarController, UITabBarControllerDelegate {

    var checkTab = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.viewControllers?.count)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(checkTab)
        if checkTab == "Gauss's Law"{
            print(checkTab)
            print(self.viewControllers)
            self.viewControllers?.remove(at: 2)
//            if let tabBarItem =   self.tabBarController?.tabBar.items?[2] as? UITabBarItem{
//                tabBarItem.isEnabled = false
//            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
