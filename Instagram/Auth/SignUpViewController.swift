//
//  SignUpViewController.swift
//  Instagram
//
//  Created by ASW-研修１ on 2020/05/08.
//  Copyright © 2020 ASW-研修１. All rights reserved.
//

import UIKit


import PGFramework
// MARK: - Property
class SignUpViewController: BaseViewController {
    

    @IBOutlet weak var mainView: SignUpMainView!
}
// MARK: - Life cycle
extension SignUpViewController {
    override func loadView() {
        super.loadView()
        setDelegate()
        tabBarController?.tabBar.isHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
// MARK: - Protocol
extension SignUpViewController :SignUpMainViewDelegate{
    func touchedSignUpButton() {
        let userModel : UserModel = UserModel()
        userModel.nickname = mainView.userNameTextField.text
        userModel.mail = mainView.mailAddressTextField.text
        userModel.password = mainView.passWordTextField.text
        UserModel.create(request: userModel, success: {
            let topViewController = TopViewController()
            self.navigationController?.pushViewController(topViewController, animated: true)
            self.animatorManager.navigationType = .slide_push
        }) { (error) in
            print("SignUpエラー：",error)
            }
    }
}
// MARK: - method
extension SignUpViewController {
    func setDelegate(){
        mainView.delegate = self
    }
}

