//
//  NextMainView.swift
//  Instagram
//
//  Created by ASW-研修１ on 2020/04/21.
//  Copyright © 2020 ASW-研修１. All rights reserved.
//

import UIKit

import PGFramework
protocol NextMainViewDelegate: NSObjectProtocol{
}
extension NextMainViewDelegate {
}
// MARK: - Property
class NextMainView: BaseView {
    weak var delegate: NextMainViewDelegate? = nil
    @IBOutlet weak var roundView: UIImageView!
    @IBOutlet weak var discriptionLabel: UILabel!
    @IBOutlet weak var postImage: UIImageView!
}
// MARK: - Life cycle
extension NextMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setLayout()
    }
}
// MARK: - Protocol
extension NextMainView {
    func setLayout() {
        roundView.layer.cornerRadius = 20
    }
}
