//
//  DataManager.swift
//  Englishman
//
//  Created by Godjira on 12/15/20.
//  Copyright © 2020 Godjira. All rights reserved.
//

import Foundation
import Combine

class DataManager: ObservableObject {
    
    static let shared = DataManager()
    
    let uDefault = UserDefaults.standard
    
    var selectLevel: String {
        get { uDefault.string(forKey: "select_level") ?? "" }
        set {
            uDefault.set(newValue, forKey: "select_level")
        }
    }
    
    var sentences: [Sentence]? {
        get {
            if selectLevel == "" {
                selectLevel = Constants.localStoreNames.first!
            }
            return PackManager.shared.getLevel(name: selectLevel)?.sentences.shuffled()
        }
    }
    
    

}
