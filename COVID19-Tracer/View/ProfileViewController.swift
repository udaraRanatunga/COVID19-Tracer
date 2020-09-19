//
//  ProfileViewController.swift
//  COVID19-Tracer
//
//  Created by Udara Ranatunga on 9/19/20.
//  Copyright © 2020 Udara Ranatunga. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase
class ProfileViewController: UIViewController {
   
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var hometown: UITextField!
    @IBOutlet weak var faculty: UITextField!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var course: UITextField!
    var uid: String? = nil;
    var email: String! = nil;
    var ref:DatabaseReference?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     ref = Database.database().reference()
     if Auth.auth().currentUser != nil {
            let user = Auth.auth().currentUser
            if let user = user {
              uid = user.uid
              email = user.email!
                print("uid"+uid!);
            }
        showData();
        }
    }
    func showData() {
        name.text = email;
        ref?.child("Users").child(uid!).observeSingleEvent(of: .value, with: { (snapshot) in
          // Get user value
            let value = snapshot.value as? NSDictionary;
            var course1: String? = value?["course"] as? String ?? "";
            var hometown1: String? = value?["hometown"] as? String ?? "";
            var faculty1: String? = value?["faculty"] as? String ?? "";
            var temp1: Double? = value?["temp"] as? Double ?? 0.00;
            self.hometown.text = hometown1;
            self.course.text = course1;
            self.faculty.text = faculty1;
            self.temp.text = "\(String(describing: temp1)) ℃"
           
            

          }) { (error) in
            print(error.localizedDescription)
        }
    }

    @IBAction func update(_ sender: UIButton) {
        ref?.child("Users").child(uid!).child("uid").setValue(uid);
        ref?.child("Users").child(uid!).child("course").setValue(course.text);
        ref?.child("Users").child(uid!).child("hometown").setValue(hometown.text);
        ref?.child("Users").child(uid!).child("faculty").setValue(faculty.text);    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
