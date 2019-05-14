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
    var dataModel : Any?

    func getRebootData(completion: @escaping ( _ dataModel: MovieDataModel) -> ()) {
        let jsonUrl = URL(string: JSONURL)

        let dataTask = URLSession.shared.dataTask(with: jsonUrl!) {
            (data, response, error) in

            guard let data = data else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let mediaData = try
                    decoder.decode(MovieDataModel.self, from: data)
                
                self.dataModel = mediaData
                
            } catch let err {
                print("Error", err)
            }
            DispatchQueue.main.async {
                completion(self.dataModel as! MovieDataModel)
            }
        }
        dataTask.resume()

    }
}
