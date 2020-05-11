//
//  SignInViewController.swift
//  Instagram
//
//  Created by ASW-研修１ on 2020/05/11.
//  Copyright © 2020 ASW-研修１. All rights reserved.
//

import UIKit

import PGFramework
// MARK: - Property
class SignInViewController: BaseViewController {
    @IBOutlet weak var mainView: SignInMainView!
    var userModel : UserModel=UserModel()
}
// MARK: - Life cycle
extension SignInViewController {
    override func loadView() {
        super.loadView()
        setDelegate()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
// MARK: - Protocol
extension SignInViewController :SignInMainViewDelegate{
    
    func touchedSignInButton2() {
        guard let mail = mainView.mailAddressTextField.text else {return}
        guard let pass = mainView.passWordTextField.text else {return}
        UserModel.signIn(email:mail, pass: pass, failure: { (error) in
            print("SignInエラー：",error)
        }) {
            let topViewController = TopViewController()
            self.navigationController?.pushViewController(topViewController, animated: true)
            self.animatorManager.navigationType = .slide_push
        }
    }
 
    
    func touchedSignUpButton2() {
        navigationController?.popViewController(animated: true)
        animatorManager.navigationType = .slide_pop
    }
    
}
// MARK: - method
extension SignInViewController {
    func setDelegate(){
        mainView.delegate = self
        
    }
}

