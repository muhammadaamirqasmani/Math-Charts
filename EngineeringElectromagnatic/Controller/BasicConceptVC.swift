//
//  BasicConceptVC.swift
//  EngineeringElectromagnatic
//
//  Created by Techsviewer on 11/04/2018.
//  Copyright © 2018 maqCloud. All rights reserved.
//

import UIKit

class BasicConceptVC: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var Image: UIImageView!
    var sendData: [TopicObj] = []
    var imageArray1 : [UIImage] = []
    var Content:String = String()
    @IBOutlet weak var TextView: UITextView!
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.TextView.isEditable = false
        collectionView.dataSource = self
        collectionView.delegate = self
        self.Image.image = imageArray1[0]
        self.TextView.text = sendData[0].content
        // Do any additional setup after loading the view.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray1.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TopicCVC
        cell.Images.image = imageArray1[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        Image.image = imageArray1[indexPath.row]
    }
    
}
