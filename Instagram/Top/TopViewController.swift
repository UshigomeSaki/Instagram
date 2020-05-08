//
//  TopViewController.swift
//  Instagram
//
//  Created by ASW-研修１ on 2020/04/21.
//  Copyright © 2020 ASW-研修１. All rights reserved.
//

import UIKit
import PGFramework
import FirebaseAuth

// MARK: - Property
class TopViewController: BaseViewController {
    @IBOutlet weak var mainView: TopMainView!
    @IBOutlet weak var headerView: HeaderView!
    
    var postModels : [PostModel] = [PostModel]()
}
// MARK: - Life cycle
extension TopViewController {
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
            let signupViewCOntroller = SignUpViewController()
            navigationController?.pushViewController(signupViewCOntroller, animated: false)
        }
        getModel()
    }
}
// MARK: - Protocol
extension TopViewController :TopMainViewDelegate{
    func didSelectRowAt(indexPath : IndexPath) {
        let nextViewController = NextViewController()
        nextViewController.postModel = postModels [indexPath.row]
        navigationController?.pushViewController(nextViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
}

extension TopViewController:HeaderViewDelegate{
    func touchedRightButton(_ sender: UIButton) {
        let newPostViewController = NewPostViewController()
        navigationController?.pushViewController(newPostViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
}

// MARK: - method
extension TopViewController {
    func setLayout(){
        headerView.setCenter(text: "Home", fontSize: 18, color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
        if let image = UIImage(named: "plus"){
            headerView.setRight(image: image)}
        headerView.setLeft(text: "")
    }
    func setDelegate(){
        mainView.delegate = self
        headerView.delegate = self
    }
    func getModel(){
        PostModel.reads { (postModels) in
            self.postModels = postModels
            self.mainView.getModel(postModels:postModels)
        }
    }
}

