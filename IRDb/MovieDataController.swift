//
//  MovieDataController.swift
//  IRDb
//
//  Created by Alec Smith on 3/20/19.
//  Copyright © 2019 Alec Smith. All rights reserved.
//

import UIKit

class MovieDataController: NSObject {
    
    let JSONURL = "https://api.myjson.com/bins/1e5uji"

    var rebootDataModel: MovieDataModel
    
    func getRebootData(completion: @escaping (_ success: Bool) -> ()) {
        
        var success = false
        let jsonUrl = URL(string: JSONURL)
        
        let dataTask = URLSession.shared.dataTask(with: jsonUrl) { (data, response, error) in
            guard let _ = data, error == nil else {
                return
            }

        }
    }
}
