//
//  LearnManager.swift
//  Englishman
//
//  Created by Godjira on 12/11/20.
//  Copyright © 2020 Godjira. All rights reserved.
//

import Foundation
import Combine

class LearnVM: ObservableObject {
  
  private var sentences = [Sentence]()
  var showEng = false {
    didSet {
      if showEng == false {
        selectIndex += 1
      }
      if selectIndex >= sentences.count {
        updateSentences()
        sentences = DataManager.shared.sentences
        selectIndex = 0
      }
      
      sentence = sentences[selectIndex]
      saySentence()
      
    }
  }
  
  @Published var isNeedUpdate: Bool = false
  
  private var selectIndex = 0
  
  @Published var sentence: Sentence = Sentence(ru: " ! Stub !", en:  "! Stub !")
  
  func setup() {
    updateSentences()
    sentence = sentences[selectIndex]
  }
  
  func updateSentences() {
    sentences = DataManager.shared.sentences
  }
  
  func saySentence(withUpdate: Bool = true) {
    SpeechManager.shared.say(sentences[selectIndex], en: showEng, complition: {
      if self.showEng && withUpdate {
        self.isNeedUpdate = true
      }
    })
    
  }
  
}
