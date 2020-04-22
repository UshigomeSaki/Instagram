//
//  PostModel.swift
//  Instagram
//
//  Created by ASW-研修１ on 2020/04/22.
//  Copyright © 2020 ASW-研修１. All rights reserved.
//

import UIKit
import PGFramework
import FirebaseDatabase

class PostModel {
    var post_user_name: String = String()
    var psot_sentence: String = String()
    var image_path: String = String()
}

extension PostModel{
    static func setParameter(request: PostModel) -> [String:Any] {
        var parameter:[String:Any] = [:]
        parameter["post_user_name"] = request.post_user_name
        parameter["post_sentence"] = request.psot_sentence
        parameter["image_path"] = request.image_path
        
        return parameter
    }
    
}

//MARK: -Create
extension PostModel{
    static func create(request: PostModel,success:@escaping () -> Void) {
        let dbRef = Database.database().reference().child("post").childByAutoId()
        let parameter = setParameter(request: request)
        dbRef.setValue(parameter)
        success()
    }
}


//MARK: -Read
extension PostModel{
}

//MARK: -Update
extension PostModel{
}

//MARK: -Delete
extension PostModel{
}
