//
//  Representative.swift
//  Representatives
//
//  Created by Jonathan Rogers on 4/27/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Representative {


    static let kNameKey = "name"
    static let kPartyKey = "party"
    static let kStateKey = "state"
    static let kDistrictKey = "district"
    static let kPhoneKey = "phone"
    static let kOfficeKey = "office"
    static let kLinkKey = "link"
    static let kResultsKey = "results"
    
    var name: String?
    var party: String?
    var state: String?
    var district: String?
    var phone: String?
    var office: String?
    var link: String?
    
    init(JSONDictionary: [String: String]) {
        
        self.name = JSONDictionary[Representative.kNameKey]
        self.party = JSONDictionary[Representative.kPartyKey]
        self.state = JSONDictionary[Representative.kStateKey]
        self.district = JSONDictionary[Representative.kDistrictKey]
        self.phone = JSONDictionary[Representative.kPhoneKey]
        self.office = JSONDictionary[Representative.kOfficeKey]
        self.link = JSONDictionary[Representative.kLinkKey]
        
    }

}
