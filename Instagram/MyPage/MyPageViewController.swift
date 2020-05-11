//
//  MyPageViewController.swift
//  Instagram
//
//  Created by ASW-研修１ on 2020/04/21.
//  Copyright © 2020 ASW-研修１. All rights reserved.
//

import UIKit
import FirebaseAuth

import PGFramework
// MARK: - Property
class MyPageViewController: BaseViewController {
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var mainView: MyPageMainView!
}
// MARK: - Life cycle
extension MyPageViewController {
    override func loadView() {
        super.loadView()
        setLayout()
        setDelegate()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if Auth.auth().currentUser == nil{
            let signUpViewController = SignUpViewController()
            navigationController?.pushViewController(signUpViewController, animated: false)
        }
    }
}
// MARK: - Protocol
extension MyPageViewController :MyPageMainViewDelegate{
    func editProfileButton() {
        let editProfileViewController = EditProfileViewController()
        editProfileViewController.modalPresentationStyle = .fullScreen
        present(editProfileViewController, animated: true, completion: nil)
    }
    
}
// MARK: - method
extension MyPageViewController {
    func setLayout(){
        headerView.setCenter(text: "My Page", fontSize: 18, color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
        headerView.setLeft(text: "")
    }
    func setDelegate(){
        mainView.delegate = self
    }
}

