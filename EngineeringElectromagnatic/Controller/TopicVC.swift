//
//  ViewController.swift
//  EngineeringElectromagnatic
//
//  Created by Techsviewer on 07/04/2018.
//  Copyright © 2018 maqCloud. All rights reserved.
//

import UIKit

//protocol MyProtocol:NewDelegate? {
//    func didTapCell1
//}
var gif = ""

class TopicVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
      @IBOutlet weak var tableView: UITableView!
    var topicList: [TopicObj] = []
    var imageArray = [UIImage]()
    var TopicTitelName = String()
    var topicTitleImageShow = UIImage()
    var Content = String()
    var quizArray = [Quiz]()
    var quizArray1 = [Quiz]()
    var topic01 = TopicObj(topicTitle: "Wave Polarisation", topicImage: [#imageLiteral(resourceName: "a1"), #imageLiteral(resourceName: "a2"), #imageLiteral(resourceName: "a3")], TopicTitelImage: #imageLiteral(resourceName: "a2"), content: """
There are several ways in which electromagnetic waves are capable of polarizing into. They are namely, circular polarisation, elliptical polarisation and linear polarisation.
 
All waves are typically elliptically polarized unless they meet the following conditions:
A. Both Ex and Ey have the same value AND there is a phase difference of
B. No phase difference
 
A results in the graph to be circularly polarized.
B results in the graph to be linearly polarized.
 
""")
    var topic02 = TopicObj(topicTitle: "Gauss's Law", topicImage: [#imageLiteral(resourceName: "a4")], TopicTitelImage: #imageLiteral(resourceName: "a4"), content: """
What is the Gauss’ Law?
 
The electric flux passing through any closed surface is equal to the total charge enclosed by that surface.
 
Gauss’ law Equation:
D= charge enclosed = Q
where Ds is the vector at the surface of the object and Ds normal (in the picture) is the vector that is normal to that portion of the surface.
 
This equation states that all charge enclosed within a surface is equal to the electric flux through the enclosed surface.
""")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        topicList.append(topic01)
        topicList.append(topic02)
        
        quizArray1.append(Quiz(Question: "Gauss's law due to different charge distribution is used to calculate", Ans: ["Electric field","Electric charge","Electric intensity","Electric field lines"], CorrectAns: "Electric intensity"))
        quizArray1.append(Quiz(Question: "A positive charge Q= 8 mC is placed inside the cavity of a neutral spherical conducting shell with an inner radius a and an outer radius b. Find the charges induced at the inner and outer surfaces of the shell.", Ans: ["Inner charge = –8 mC, Outer charge = +8 mC ","Inner charge = +8 mC, Outer charge = -8 mC "," Inner charge = 0 mC, Outer charge = +8 mC ","Inner charge = –8 mC, Outer charge = 0 mC "], CorrectAns: "Inner charge = –8 mC, Outer charge = +8 mC "))
        quizArray1.append(Quiz(Question: "Find the flux through a spherical Gaussian surface of radius a = 1 m surrounding a charge of 8.85 pC.", Ans: ["1 x N  /C ","1 x  N  /C ","1 x N /C ","1 N /C "], CorrectAns: "1 N /C "))
        quizArray.append(Quiz(Question: "What are the types of polarization that could occur?", Ans: ["Circular and Triangular","Circular, Elliptical and Linear","Triangular","Triangular and Linear"], CorrectAns: "Circular, Elliptical and Linear"))
        let quiz2 = Quiz(Question: """
Linear polarization can be obtained only
if the wave consists of ________
""", Ans: ["Ex","Ey", "Both E x  & E y  & in phase","Both E x  & E y  & out of phase"], CorrectAns: "Both E x  & E y  & in phase")
        
        quizArray.append(quiz2)
        quizArray.append(Quiz(Question: "Which among the below mentioned magnetic quantities is/are dependent on media/medium?", Ans: ["B","H","Both a and b","None of the above"], CorrectAns: "B"))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topicList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopicCell", for: indexPath) as! TopicTVC
//        cell.TopicImage.image = topicList[indexPath.row].TopicTitelImage
        cell.TopicTitle.text = topicList[indexPath.row].topicTitle
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Topics List"
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopicCell", for: indexPath) as! TopicTVC
        imageArray = []
        
        for item in topicList[indexPath.row].topicImages{
            imageArray.append(item)
        }
        
        topicTitleImageShow = topicList[indexPath.row].TopicTitelImage
        TopicTitelName = topicList[indexPath.row].topicTitle
        Content = topicList[indexPath.row].content
        self.performSegue(withIdentifier: "TopicCell", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabCtrl = segue.destination as! EETabBarVC
        let destinationVC = tabCtrl.viewControllers![0] as! BasicConceptVC
        let sendingObject = TopicObj(topicTitle: TopicTitelName, topicImage: imageArray, TopicTitelImage: topicTitleImageShow, content: Content)
        destinationVC.imageArray1 = imageArray
        destinationVC.sendData.append(sendingObject)
        let destinationQuickQuizVC = tabCtrl.viewControllers![1] as! QuickQuizVC
        destinationQuickQuizVC.quizArray3 = []
        if TopicTitelName == "Wave Polarisation"{
            tabCtrl.checkTab = "Wave Polarisation"
            gif = "Wave Polarisation"
            destinationQuickQuizVC.quizArray3 = quizArray
        }else if TopicTitelName == "Gauss's Law"{
            tabCtrl.checkTab = "Gauss's Law"
            gif = "Gauss's Law"
            destinationQuickQuizVC.quizArray3 = quizArray1
        }else{
            return
        }
    }
}

