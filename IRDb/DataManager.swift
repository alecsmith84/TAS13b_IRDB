//
//  DataManager.swift
//  IRDb
//
//  Created by Alec Smith on 5/13/19.
//  Copyright © 2019 Alec Smith. All rights reserved.
//

import UIKit

class DataManager: NSObject {
    let url = "https://api.myjson.com/bins/1e5uji"
    
    var dataArray = ["no data"]
    
    func getData(completion: @escaping (_ success: Bool) -> ()) {
        var success = true
        
        let actualURL = URL(string:url)
        
        let task = URLSession.shared.dataTask(with: actualURL!) {
            (data, response, error) in
            guard let _ = data, error == nil else {
                success = false
                return
            }
            
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                print(jsonObj!.value(forKey: "franchise")!)
                
                if let testArray = jsonObj!.value(forKey: "franchise") as? Array<String> {
                    self.dataArray = testArray
                }
            }
            completion(success)
        }
        task.resume()
    }
}
