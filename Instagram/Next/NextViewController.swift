//
//  NextViewController.swift
//  Instagram
//
//  Created by ASW-研修１ on 2020/04/21.
//  Copyright © 2020 ASW-研修１. All rights reserved.
//

import UIKit

import PGFramework
// MARK: - Property
class NextViewController: BaseViewController {
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var mainView: NextMainView!
    
    var postmodel : PostModel = PostModel()
}
// MARK: - Life cycle
extension NextViewController {
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
        setLabel()
    }
}

extension NextViewController:HeaderViewDelegate{
    func touchedLeftButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        animatorManager.navigationType = .slide_pop
    }
    func touchedRightButton(_ sender: UIButton) {
        let editViewController = EditViewController()
        editViewController.postModel = postmodel
        editViewController.modalPresentationStyle = .fullScreen
        present(editViewController, animated: true, completion: nil)
    }
}
// MARK: - Protocol
extension NextViewController {
}
// MARK: - method
extension NextViewController {
    func setLayout(){
        headerView.setCenter(text: "投稿詳細", fontSize: 18, color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
        if let image = UIImage(named: "back"){
            headerView.setLeft(image: image)
        }
        if let image = UIImage(named:"san"){
            headerView.setRight(image: image)
        }
        
    }
    func setDelegate(){
        headerView.delegate = self
        
    }
    func setLabel(){
        mainView.discriptionLabel.text = postmodel.discription
    }
}
