//
//  UpdateViewController.swift
//  COVID19-Tracer
//
//  Created by Udara Ranatunga on 9/15/20.
//  Copyright © 2020 Udara Ranatunga. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class UpdateViewController: UIViewController {
    @IBOutlet weak var temp: UITextField!
    @IBOutlet weak var showtemp: UILabel!
    var ref:DatabaseReference?
    var uid: String!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .lightGray;
        ref = Database.database().reference()
        if Auth.auth().currentUser != nil {
            let user = Auth.auth().currentUser
            uid = user!.uid;
           }
        showData();
    
    }

    func showData(){
        ref?.child("Users").child(uid!).observeSingleEvent(of: .value, with: { (snapshot) in
                 // Get user value
            let value = snapshot.value as? NSDictionary;
            var temp1: Double? = value?["temp"] as? Double ?? 0.00;
            self.showtemp.text = "\(String(describing: temp1)) ℃"
            
        }) {
            (error) in
            print(error.localizedDescription)        }
    }
    @IBAction func updateTemp(_ sender: UIButton) {
        ref?.child("Users").child(uid!).child("temp").setValue((temp.text as! NSString).doubleValue);
        
    }
    
    
}

