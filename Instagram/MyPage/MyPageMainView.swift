//
//  MyPageMainView.swift
//  Instagram
//
//  Created by ASW-研修１ on 2020/04/21.
//  Copyright © 2020 ASW-研修１. All rights reserved.
//

import UIKit

import PGFramework
protocol MyPageMainViewDelegate: NSObjectProtocol{
    func editProfileButton()
}
extension MyPageMainViewDelegate {
}
// MARK: - Property
class MyPageMainView: BaseView {
    weak var delegate: MyPageMainViewDelegate? = nil
  
    @IBOutlet weak var button: UIButton!
    @IBAction func editProfileButton(_ sender: UIButton) {
        if let delegate = delegate {delegate.editProfileButton()}
    }
    @IBOutlet weak var roundView: UIImageView!
}
// MARK: - Life cycle
extension MyPageMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setLayout()
    }
}
// MARK: - Protocol
extension MyPageMainView {
    func setLayout(){
        button.layer.borderWidth = 0.5
        button.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        button.layer.cornerRadius = 5
        roundView.layer.cornerRadius = 35
    }
}
