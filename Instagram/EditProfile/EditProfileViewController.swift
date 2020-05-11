//
//  EditProfileViewController.swift
//  Instagram
//
//  Created by ASW-研修１ on 2020/05/11.
//  Copyright © 2020 ASW-研修１. All rights reserved.
//

import UIKit
import PGFramework
// MARK: - Property
class EditProfileViewController: BaseViewController {
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var mainView: EditProfileMainView!
    
    var userModel : UserModel=UserModel()
}
// MARK: - Life cycle
extension EditProfileViewController {
    override func loadView() {
        super.loadView()
        setHeaderView()
        setDelegate()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        giveModel()
    }
}
// MARK: - Protocol
extension EditProfileViewController :HeaderViewDelegate{
    func touchedLeftButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    func touchedRightButton(_ sender: UIButton) {
        if let text = mainView.userNameTextField.text{
            userModel.nickname = text
            UserModel.update(request: userModel) {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
}
extension EditProfileViewController :EditProfileMainViewDelegate{
    func logOutButton() {
        UserModel.logOut {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
}
// MARK: - method
extension EditProfileViewController {
    func setHeaderView(){
        headerView.setLeft(text: "キャンセル", fontSize: 18, color: #colorLiteral(red: 0.7404877639, green: 0.7449720201, blue: 1, alpha: 1))
        headerView.setCenter(text: "プロフィール編集", fontSize: 18, color: #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1))
        headerView.setRight(text: "完了", fontSize: 18, color: #colorLiteral(red: 0.7404877639, green: 0.7449720201, blue: 1, alpha: 1))
    }
    func setDelegate(){
        headerView.delegate = self
        mainView.delegate = self
    }
    func giveModel(){
        mainView.updateView(userModel:userModel)
    }

}
