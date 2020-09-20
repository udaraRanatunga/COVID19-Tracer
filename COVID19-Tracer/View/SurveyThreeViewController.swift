//
//  SurveyThreeViewController.swift
//  COVID19-Tracer
//
//  Created by Udara Ranatunga on 9/20/20.
//  Copyright © 2020 Udara Ranatunga. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase
class SurveyThreeViewController: UIViewController {
var uid: String? = nil;
var ref:DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        if Auth.auth().currentUser != nil {
           let user = Auth.auth().currentUser
           if let user = user {
             uid = user.uid
               print("uid"+uid!);
           }
        }
    }
    
    @IBAction func clickedYes(_ sender: UIButton) {
        ref?.child("Survey").child(uid!).child("3").setValue(1);
        performSegue(withIdentifier: "survey4", sender: self)     }
   
    
    @IBAction func clickedNo(_ sender: UIButton) {
        ref?.child("Survey").child(uid!).child("3").setValue(0);
        performSegue(withIdentifier: "survey4", sender: self)       }
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
