//
//  SettingsViewController.swift
//  COVID19-Tracer
//
//  Created by Udara Ranatunga on 9/15/20.
//  Copyright © 2020 Udara Ranatunga. All rights reserved.
//

import UIKit
import Firebase
class SettingsViewController: UIViewController {
  
    override func viewDidLoad() {
        super.viewDidLoad()
          
        // Do any additional setup after loading the view.
    }
    @IBAction func logout(_ sender: UIButton) {
        let auth = Auth.auth()
        do{
            try auth.signOut()
            self.dismiss(animated: true,completion: nil)        }
        catch let signOutError {
            print("error");
    }
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
