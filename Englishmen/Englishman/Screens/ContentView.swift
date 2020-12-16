//
//  ContentView.swift
//  Englishman
//
//  Created by Godjira on 12/10/20.
//  Copyright © 2020 Godjira. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            LevelsScreen().tabItem({
                Text("Levels")
                Image("levels")
                })
            LearnView(learnVM: VMConfigurator.setupLearnVM()).tabItem({
                Text("LearnScreen")
                Image("learn")
            })
            ClueScreen().tabItem({
                Text("ClueScreen")
                Image("tips")
            })
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
