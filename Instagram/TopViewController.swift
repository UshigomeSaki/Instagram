//
//  TopViewController.swift
//  Instagram
//
//  Created by ASW-研修１ on 2020/04/21.
//  Copyright © 2020 ASW-研修１. All rights reserved.
//

import UIKit

import PGFramework
// MARK: - Property
class TopViewController: BaseViewController {
    @IBOutlet weak var mainView: TopMainView!
    @IBOutlet weak var headerView: HeaderView!
}
// MARK: - Life cycle
extension TopViewController {
    override func loadView() {
        super.loadView()
        setLayout()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
// MARK: - Protocol
extension TopViewController {
}
// MARK: - method
extension TopViewController {
    func setLayout(){
        headerView.setCenter(text: "Home", fontSize: 18, color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
        headerView.setRight(text: "投稿", fontSize: 18, color: #colorLiteral(red: 0.6743580091, green: 0.6239380521, blue: 0.8428714463, alpha: 1))
        headerView.setLeft(text: "")
    }
}

