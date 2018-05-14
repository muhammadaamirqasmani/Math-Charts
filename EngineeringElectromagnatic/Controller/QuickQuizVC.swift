//
//  QuickQuizVC.swift
//  EngineeringElectromagnatic
//
//  Created by Techsviewer on 11/04/2018.
//  Copyright © 2018 maqCloud. All rights reserved.
//

import UIKit

class QuickQuizVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    @IBOutlet weak var QuizLbl: UILabel!
 
    @IBOutlet weak var NextButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    var CorrectAnswer = ""
    var selectedAnswer = ""
    var CountOfArray = 0
    var quizArray3 = [Quiz]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        NextButton.isEnabled = false
        
        // Do any additional setup after loading the view.
    }

    var count = 0

    @IBAction func PreviousButton(_ sender: Any) {
        
        
        if (CountOfArray < quizArray3.count - 1 && CountOfArray > 0){
            CountOfArray = CountOfArray - 1
            self.tableView.reloadData()
        }
       

    }
        
    @IBAction func next(_ sender: Any) {
        if CorrectAnswer != selectedAnswer{
            let alert = UIAlertController(title: "Alert", message: "Wrong Answer", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        else if CountOfArray < quizArray3.count-1{
            let alert1 = UIAlertController(title: "Alert", message: "Correct Awnser", preferredStyle: UIAlertControllerStyle.alert)
            alert1.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert1, animated: true, completion: nil)
            
            CountOfArray = CountOfArray + 1
            tableView.reloadData()
            
            NextButton.isEnabled = false
            
        }else{
            CountOfArray = 0
            tableView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizArray3[CountOfArray].Ans.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! QuizTVC
        cell.QuizLbl.text = quizArray3[CountOfArray].Ans[indexPath.row]
        QuizLbl.text = quizArray3[CountOfArray].Question
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedAnswer = quizArray3[CountOfArray].Ans[indexPath.row]
        CorrectAnswer = quizArray3[CountOfArray].CorrectAns
        if (self.tableView.cellForRow(at: indexPath)?.isSelected)! {
            NextButton.isEnabled = true
        }
    }
    
    func Next() {
        CountOfArray = CountOfArray + 1
    }
}
