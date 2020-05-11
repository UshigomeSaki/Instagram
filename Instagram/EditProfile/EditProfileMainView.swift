//
//  EditProfileMainView.swift
//  Instagram
//
//  Created by ASW-研修１ on 2020/05/11.
//  Copyright © 2020 ASW-研修１. All rights reserved.
//

import UIKit
import PGFramework
protocol EditProfileMainViewDelegate: NSObjectProtocol{
    func logOutButton()
}
extension EditProfileMainViewDelegate {
}
// MARK: - Property
class EditProfileMainView: BaseView {
    weak var delegate: EditProfileMainViewDelegate? = nil

    @IBOutlet weak var userNameTextField: UITextField!
    @IBAction func logOutButton(_ sender: UIButton) {
        if let delegate = delegate {delegate.logOutButton()}
    }
}
// MARK: - Life cycle
extension EditProfileMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension EditProfileMainView {
}
// MARK: - method
extension EditProfileMainView {
    func updateView(userModel:UserModel){
        userNameTextField.text = userModel.nickname
    }
}
