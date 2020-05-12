//
//  NewPostViewController.swift
//  Instagram
//
//  Created by ASW-研修１ on 2020/04/22.
//  Copyright © 2020 ASW-研修１. All rights reserved.
//

import UIKit

import PGFramework
// MARK: - Property
class NewPostViewController: BaseViewController {
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var mainView: NewPostMainView!
}
// MARK: - Life cycle
extension NewPostViewController {
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
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage{
            mainView.postImageView.image = image
            picker.dismiss(animated: true, completion: nil)
        }
    }
}


extension NewPostViewController:HeaderViewDelegate{
    func touchedLeftButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        animatorManager.navigationType = .slide_pop
    }
    func touchedRightButton(_ sender: UIButton) {
        let postModel : PostModel = PostModel()
        if let text = mainView.textField.text{
            postModel.discription = text
        }
        var images:[UIImage] = []
        if let image = mainView.postImageView.image{
            images.append(image)
        }
        postModel.post_user_name = ""
        PostModel.create(request: postModel, images: images){
            self.navigationController?.popViewController(animated: true)
            self.animatorManager.navigationType = .slide_pop
        }
    }
}

extension NewPostViewController:NewPostMainViewDelegate{
    func touchedAddButton() {
        useCamera()
    }
    
    
}
// MARK: - Protocol
extension NewPostViewController {
}
// MARK: - method
extension NewPostViewController {
    func setLayout(){
        headerView.setLeft(text: "キャンセル", fontSize: 18, color: #colorLiteral(red: 0.7404877639, green: 0.7449720201, blue: 1, alpha: 1))
        headerView.setCenter(text: "新規投稿", fontSize: 18, color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
        headerView.setRight(text: "シェア", fontSize: 18, color: #colorLiteral(red: 0.7404877639, green: 0.7449720201, blue: 1, alpha: 1))
    }
    func setDelegate(){
        headerView.delegate = self
        mainView.delegate = self
    }
}

