//
//  NewPostMainView.swift
//  Instagram
//
//  Created by ASW-研修１ on 2020/04/22.
//  Copyright © 2020 ASW-研修１. All rights reserved.
//

import UIKit
import PGFramework
protocol NewPostMainViewDelegate: NSObjectProtocol{
    func touchedAddButton()
}
extension NewPostMainViewDelegate {
}
// MARK: - Property
class NewPostMainView: BaseView {
    weak var delegate: NewPostMainViewDelegate? = nil
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var postImageView: UIImageView!
    @IBAction func touchedAddButton(_ sender: UIButton) {
        if let delegate = delegate {delegate.touchedAddButton()}
    }
}
// MARK: - Life cycle
extension NewPostMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension NewPostMainView {
}

// MARK: -Method
extension NewPostMainView {
}
