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
  
  private var sentences: [Sentence]?
  
  var showStub: Bool {
    get {
      return sentence == nil
    }
  }
  
  var showEng = false {
    didSet {
      if showEng == false {
        selectIndex += 1
      }
      if selectIndex >= sentences?.count ?? 0 {
        updateSentences()
        sentences = DataManager.shared.sentences
        selectIndex = 0
      }
      
      sentence = sentences?[selectIndex]
      saySentence()
      
    }
  }
  
  @Published var isNeedUpdate: Bool = false
  
  private var selectIndex = 0
  
  @Published var sentence: Sentence?
  
  func setup() {
    updateSentences()
    sentence = sentences?[selectIndex]
  }
  
  func updateSentences() {
    sentences = DataManager.shared.sentences
  }
  
  func saySentence(withUpdate: Bool = true) {
    if let sentence = sentences?[selectIndex] {
    SpeechManager.shared.say(sentence, en: showEng, complition: {
      if self.showEng && withUpdate {
        self.isNeedUpdate = true
      }
    })
    }
  }
  
}
