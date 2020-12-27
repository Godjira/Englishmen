//
//  PackManager.swift
//  Englishman
//
//  Created by Godjira on 12/27/20.
//  Copyright © 2020 Godjira. All rights reserved.
//

import Foundation

class PackManager {
    
    static let shared = PackManager()
    
    func configurate() {
        localLevels = loadLocalLevels()
    }
    
    
    var localLevels = [Pack]()
    
    func getLevel(name: String) -> Pack? {
        for level in localLevels where level.namePack == name {
            return level
        }
        return nil
    }
    
    func loadLocalLevels() -> [Pack] {
        return Constants.localStoreNames.compactMap({ loadJsonFromLocalStore(file: $0) })
    }
    
    func loadJsonFromLocalStore(file name: String) -> Pack? {
        if let path = Bundle.main.path(forResource: name, ofType: "json") {
            if let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe), let pack = try? Pack(data: data) {
                return pack
            }
        }
        
        return nil
    }
    
}
