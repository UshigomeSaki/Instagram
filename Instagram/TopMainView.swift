//
//  TopMainView.swift
//  Instagram
//
//  Created by ASW-研修１ on 2020/04/21.
//  Copyright © 2020 ASW-研修１. All rights reserved.
//

import UIKit

import PGFramework
protocol TopMainViewDelegate: NSObjectProtocol{
    func didSelectRowAt()
}
extension TopMainViewDelegate {
}
// MARK: - Property
class TopMainView: BaseView {
    weak var delegate: TopMainViewDelegate? = nil
    @IBOutlet weak var tableView: UITableView!
}
// MARK: - Life cycle
extension TopMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegate()
        
        loadTableViewCellFromXib(tableView: tableView, cellName: "TopMainTableViewCell")
    }
}

// MARK: - Protocol
extension TopMainView:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TopMainTableViewCell")as? TopMainTableViewCell else {return UITableViewCell()}
        return cell
    }
    
}

extension TopMainView:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let delegate = delegate{delegate.didSelectRowAt()}
    }
    
}

//MARK: - Method
extension TopMainView{
    func setDelegate(){
        tableView.dataSource = self
        tableView.delegate = self
    }
}
