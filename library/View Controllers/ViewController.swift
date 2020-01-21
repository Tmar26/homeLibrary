//
//  ViewController.swift
//  library
//
//  Created by Tamara McDiarmid on 2020-01-17.
//  Copyright © 2020 Tamara McDiarmid. All rights reserved.
//

import UIKit
import FirebaseUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func loginTapped(_ sender: UIButton) {
        //Get the default auth UI object
        let authUI = FUIAuth.defaultAuthUI()
        guard authUI != nil else{
            //log error
            return
        }
        //set me as delegate
        authUI?.delegate = self
        authUI?.providers = [FUIEmailAuth()]
        
        //get reference to the auth UI view controller
        let authViewController = authUI!.authViewController()
        
        //show it
        present(authViewController,animated: true,completion: nil)
    }
}

extension ViewController: FUIAuthDelegate{
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        //check if error
        guard error == nil else{
            return
        }
        //used to get user id from firebase
        //authDataResult?.user.uid
        performSegue(withIdentifier: "welcomeScreen", sender: self)
    }
}
