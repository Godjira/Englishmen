//
//  LevelsVM.swift
//  Englishman
//
//  Created by Godjira on 12/27/20.
//  Copyright © 2020 Godjira. All rights reserved.
//

import Foundation

class LevelsVM: ObservableObject {
    
    var levels: [Pack] {
        get {
            return PackManager.shared.localLevels
        }
    }
    
}
