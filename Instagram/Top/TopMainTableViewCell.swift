//
//  TopMainTableViewCell.swift
//  Instagram
//
//  Created by ASW-研修１ on 2020/04/21.
//  Copyright © 2020 ASW-研修１. All rights reserved.
//

import UIKit

import PGFramework
protocol TopMainTableViewCellDelegate: NSObjectProtocol{
}
extension TopMainTableViewCellDelegate {
}
// MARK: - Property
class TopMainTableViewCell: BaseTableViewCell {
    weak var delegate: TopMainTableViewCellDelegate? = nil
    @IBOutlet weak var roundView: UIImageView!
    @IBOutlet weak var discriptionLabel: UILabel!
    @IBOutlet weak var postImage: UIImageView!
}
// MARK: - Life cycle
extension TopMainTableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        setLayout()
    }
}
// MARK: - Protocol
extension TopMainTableViewCell {
    func setLayout(){
        roundView.layer.cornerRadius = 20
    }
    func updateCell(postModel:PostModel){
        discriptionLabel.text = postModel.discription
        
        if let url = URL(string: postModel.image_paths[0]){
            postImage.af_setImage(withURL: url)
        }
    }
}
