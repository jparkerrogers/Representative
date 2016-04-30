//
//  NetworkController.swift
//  Representatives
//
//  Created by Jonathan Rogers on 4/27/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class NetworkController {
    
    static let baseURLString = "http://whoismyrepresentative.com"
    
    static func searchURLByState(state: String) -> NSURL {
        return NSURL(string: NetworkController.baseURLString + "/getall_reps_bystate.php?state=\(state)&output=json")!
    }
    
    static func dataAtURL(url: NSURL, completion:(resultData: NSData?) -> Void) {
        let session = NSURLSession.sharedSession()
        
        let dataTask = session.dataTaskWithURL(url) { (data, _, error) -> Void in
            
            guard let data = data  else {
                print(error?.localizedDescription)
                completion(resultData: nil)
                return
            }
            
            completion(resultData: data)
        }
        
        dataTask.resume()
    }
    
}