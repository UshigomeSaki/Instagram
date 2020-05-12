//
//  EditMainView.swift
//  Instagram
//
//  Created by ASW-研修１ on 2020/04/27.
//  Copyright © 2020 ASW-研修１. All rights reserved.
//

import UIKit

import PGFramework
protocol EditMainViewDelegate: NSObjectProtocol{
    func touchedDeleteButton()
    func touchedImageEditButton()
}
extension EditMainViewDelegate {
}
// MARK: - Property
class EditMainView: BaseView {
    weak var delegate: EditMainViewDelegate? = nil
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func touchedDeleteButton(_ sender: UIButton) {
        if let delegate = delegate {delegate.touchedDeleteButton()}
    }
    @IBOutlet weak var postImage: UIImageView!
    var postModel : PostModel = PostModel()
    
    @IBAction func touchedImageEditButton(_ sender: UIButton) {
        if let delegate = delegate {delegate.touchedImageEditButton()}
    }
}
// MARK: - Life cycle
extension EditMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension EditMainView {
    func updateView(postModel:PostModel){
        textView.text = postModel.discription
        if let url = URL(string: postModel.image_paths[0]){
        postImage.af_setImage(withURL: url)
    }
    }
}
