//
//  LoginViewController.swift
//  COVID19-Tracer
//
//  Created by Udara Ranatunga on 9/16/20.
//  Copyright © 2020 Udara Ranatunga. All rights reserved.
//

import UIKit
import FirebaseUI
class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("inside login view")
        // Do any additional setup after loading the view.
    }
    @IBAction func authLogin(_ sender: UIButton) {
        print("inside button")
        let authUI = FUIAuth.defaultAuthUI();
        guard authUI != nil else {
            return
        }
        authUI?.delegate = self
        authUI?.providers = [FUIEmailAuth()]
        
        let authViewController = authUI?.authViewController()
        present(authViewController!,animated: true, completion: nil)    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

}
extension LoginViewController: FUIAuthDelegate {
     func authUI(_ authUI:FUIAuth, didSignInWith authDataResult: AuthDataResult?, error:Error?){
         if error != nil {
          return
         }
      performSegue(withIdentifier: "HOME", sender: self)
                
    }
 }
