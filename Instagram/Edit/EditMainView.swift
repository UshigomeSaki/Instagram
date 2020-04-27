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
}
extension EditMainViewDelegate {
}
// MARK: - Property
class EditMainView: BaseView {
    weak var delegate: EditMainViewDelegate? = nil
    @IBOutlet weak var textView: UITextView!
    
    var postModel : PostModel = PostModel()
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
    }
}
