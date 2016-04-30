//
//  RepresentativeController.swift
//  Representatives
//
//  Created by Jonathan Rogers on 4/27/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class RepresentativeController {
    
    static func searchRepsByState(state: String, completion: (representatives: [Representative]) -> Void) {
        
        let url = NetworkController.searchURLByState(state)
        
        NetworkController.dataAtURL(url) { (resultData) -> Void in
            guard let representativeData = resultData  else {
                print("NO DATA RETURNED")
                completion(representatives: [])
                return
            }
            
            do {
                let resultsDictionary = try NSJSONSerialization.JSONObjectWithData(representativeData, options: NSJSONReadingOptions.AllowFragments) as! [String : AnyObject]
                
                let representativeDictionaries = resultsDictionary[Representative.kResultsKey] as! [[String : String]]
                
                var arrayOfRepresentativeModelObjects: [Representative] = []
                
                for dictionary in representativeDictionaries {
                    let rep = Representative(JSONDictionary: dictionary)
                    arrayOfRepresentativeModelObjects.append(rep)
                    print(dictionary)
                }
                
                completion(representatives: arrayOfRepresentativeModelObjects)
                
            } catch {
                print("Error serializing JSON")
                completion(representatives: [])
                return
            }
        }
    }
}

