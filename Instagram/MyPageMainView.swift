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
}
extension MyPageMainViewDelegate {
}
// MARK: - Property
class MyPageMainView: BaseView {
    weak var delegate: MyPageMainViewDelegate? = nil
}
// MARK: - Life cycle
extension MyPageMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension MyPageMainView {
}
