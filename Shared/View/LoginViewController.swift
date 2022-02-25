//
//  LoginViewController.swift
//  MVVMLoginDemo (iOS)
//
//  Created by Ongraph on 25/02/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var lblAlertMessage:UILabel!
    @IBOutlet weak var txtFieldUserName:UITextField!
    @IBOutlet weak var txtFieldPassword:UITextField!

    var authenticator = AuthenticationProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.lblAlertMessage?.isHidden = true
    }

    //MARK:- loginUser
    @IBAction func loginUserAction(_ sender: Any) {
        self.lblAlertMessage.isHidden = true
        guard let userName = self.txtFieldUserName?.text else {return}
        guard let password = self.txtFieldPassword?.text else {return}
        
        authenticator.loginCompletionHandler { [weak self] (status, message) in
            guard let self = self else {return}
            if status {
                self.lblAlertMessage.text = "Logged in with \nusername = \(self.authenticator.username) \nemail = \(self.authenticator.email)"
                self.lblAlertMessage?.isHidden = false
                self.goToHomeView()
            } else {
                self.lblAlertMessage?.text = message
                self.lblAlertMessage?.isHidden = false
            }
        }
        authenticator.authenticateUserWith(userName, andPassword: password)
    }
    
    func goToHomeView(){
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let Vc = storyboard.instantiateViewController(withIdentifier: "HomeViewController")
        self.navigationController?.pushViewController(Vc, animated: true)
    }

}


