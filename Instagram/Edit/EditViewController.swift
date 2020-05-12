//
//  EditViewController.swift
//  Instagram
//
//  Created by ASW-研修１ on 2020/04/27.
//  Copyright © 2020 ASW-研修１. All rights reserved.
//

import UIKit

import PGFramework

// MARK: - Property
class EditViewController: BaseViewController {
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var mainView: EditMainView!
    
    var postModel: PostModel = PostModel()
    
}
// MARK: - Life cycle
extension EditViewController {
    override func loadView() {
        super.loadView()
        setDelegate()
        setLayout()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        giveModel()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    if let image = info[.originalImage] as? UIImage{
        mainView.postImage.image = image
        picker.dismiss(animated: true, completion: nil)
        }
    }
}

// MARK: - Protocol
extension EditViewController :HeaderViewDelegate{
    func touchedLeftButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    func touchedRightButton(_ sender: UIButton) {
        if let text = mainView.textView.text{
            postModel.discription = text
        }
        var images:[UIImage] = []
        if let image = mainView.postImage.image{
            images.append(image)
        }
        PostModel.update(request: postModel, images: images) {
            self.dismiss(animated: true, completion: nil)
    }
}
}
extension EditViewController:EditMainViewDelegate{
    func touchedImageEditButton() {
        useCamera()
    }
    
    func touchedDeleteButton() {
        PostModel.delete(id:postModel.id) {
            self.dismiss(animated: true, completion: nil)
        }
        }
    }
    
// MARK: - method
extension EditViewController {
    func setLayout(){
        headerView.setLeft(text: "キャンセル", fontSize: 18, color: #colorLiteral(red: 0.7404877639, green: 0.7449720201, blue: 1, alpha: 1))
        headerView.setRight(text: "完了", fontSize: 18, color: #colorLiteral(red: 0.7404877639, green: 0.7449720201, blue: 1, alpha: 1))
    }
    func setDelegate(){
        headerView.delegate = self
        mainView.delegate = self
    }
    func giveModel(){
        mainView.updateView(postModel:postModel)
    }

}


