//
//  SurveySixViewController.swift
//  COVID19-Tracer
//
//  Created by Udara Ranatunga on 9/20/20.
//  Copyright © 2020 Udara Ranatunga. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase
class SurveySixViewController: UIViewController {
    var uid: String? = nil;
    var ref:DatabaseReference?
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
               if Auth.auth().currentUser != nil {
                  let user = Auth.auth().currentUser
                  if let user = user {
                    uid = user.uid
                      print("uid"+uid!);
                  }
                ref?.child("Survey").child(uid!).observeSingleEvent(of: .value, with: { (snapshot) in
                  // Get user value
                    let value = snapshot.value as? NSDictionary;
                    let one: Int! = value?["1"] as! Int ;
                    let two: Int! = value?["2"] as! Int ;
                    let three: Int! = value?["3"] as! Int ;
                    let four: Int! = value?["4"] as! Int ;
                    let five: Int! = value?["5"] as! Int ;
                    var sum: Int!;
                    sum = one+two;
                    sum = sum+three;
                    sum = sum+four+five;
                    
                        }) { (error) in
                    print(error.localizedDescription)
                }               }
    }
    
    
    @IBAction func complete(_ sender: UIButton) {
        
        performSegue(withIdentifier: "UPDATE", sender: self)        }
}
