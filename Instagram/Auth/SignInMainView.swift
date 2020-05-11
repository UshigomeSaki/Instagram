//
//  SignInMainView.swift
//  Instagram
//
//  Created by ASW-研修１ on 2020/05/11.
//  Copyright © 2020 ASW-研修１. All rights reserved.
//

import UIKit

import PGFramework
protocol SignInMainViewDelegate: NSObjectProtocol{
    func touchedSignInButton2()
    func touchedSignUpButton2()
}
extension SignInMainViewDelegate {
}
// MARK: - Property
class SignInMainView: BaseView {
    weak var delegate: SignInMainViewDelegate? = nil
    
    @IBOutlet weak var mailAddressTextField: UITextField!
    
    @IBOutlet weak var passWordTextField: UITextField!
    @IBAction func touchedSignInButton(_ sender: UIButton) {
        if let delegate = delegate {delegate.touchedSignInButton2()}
        
    }
    @IBAction func touchedSignUpButton(_ sender: UIButton) {
        if let delegate = delegate {delegate.touchedSignUpButton2()}
            }
    
}
// MARK: - Life cycle
extension SignInMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension SignInMainView {
}
// MARK: - method
extension SignInMainView {
}
