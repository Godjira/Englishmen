//
//  ViewModelConfigurator.swift
//  Englishman
//
//  Created by Godjira on 12/16/20.
//  Copyright © 2020 Godjira. All rights reserved.
//

import Foundation

class VMConfigurator {
    
    static func setupLearnVM() -> LearnVM {
        let lvm = LearnVM()
        lvm.setup()
        return lvm
    }
    
}
