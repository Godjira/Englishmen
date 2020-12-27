//
//  LearnScreen.swift
//  Englishman
//
//  Created by Godjira on 12/11/20.
//  Copyright © 2020 Godjira. All rights reserved.
//

import SwiftUI

struct LearnView: View {
    
    @ObservedObject var learnVM: LearnVM
    
    var body: some View {
        NavigationView {
        VStack {
            if !learnVM.showStub {
            Text(learnVM.sentence!.ru)
                .font(.largeTitle)
            Spacer()
            
            if learnVM.showEng {
                Text(learnVM.sentence!.en)
                    .font(.largeTitle)
            }
            
            Spacer()
            
            Button(action: {
                self.learnVM.showEng.toggle()
            }) {
                
                Text(learnVM.showEng == true ? "Next" : "Show translate")
            }
            } else {
                Spacer()
                Text("Select level please")
                Spacer()
            }
        }.padding(16)
            
        }.onAppear(perform: setup)
    }
    
    private func setup() {
        learnVM.saySentence(withUpdate: false)
    }
    
    
}

struct LearnScreen_Previews: PreviewProvider {
    static var previews: some View {
        LearnView(learnVM: LearnVM())
    }
}
