//
//  AppView.swift
//  Englishman
//
//  Created by Godjira on 12/10/20.
//  Copyright © 2020 Godjira. All rights reserved.
//

import SwiftUI

struct LevelsView: View {
    
    @ObservedObject var levelsVM: LevelsVM
    
    
    var body: some View {
        
        List {
            ForEach(self.levelsVM.levels.map({ $0.namePack }), id: \.self) { string in
                HStack {
                    Button(string) {
                        DataManager.shared.selectLevel = string
                    }
                }
            }
        }
    }
    
    
}


struct AppView_Previews: PreviewProvider {
    
    static var previews: some View {
        LevelsView(levelsVM: LevelsVM())
    }
}
