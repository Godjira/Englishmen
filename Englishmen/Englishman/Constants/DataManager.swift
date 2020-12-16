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
    
    var selectLevel: Int {
        get { uDefault.integer(forKey: "select_level") }
        set { uDefault.set(newValue, forKey: "select_level") }
    }
    
    var sentences: [Sentence] {
        get {
            let levelSentences = Constants.levels[selectLevel]
            return levelSentences.shuffled()
        }
    }
    
}
