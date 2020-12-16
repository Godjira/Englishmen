//
//  Constants.swift
//  Englishman
//
//  Created by Godjira on 12/11/20.
//  Copyright © 2020 Godjira. All rights reserved.
//

import Foundation

struct Constants {
 
    var selectLevel: Int {
        get { UserDefaults.standard.integer(forKey: "selectLevel") }
        set { UserDefaults.standard.set(newValue, forKey: "selectLevel") }
    }
    
 static let levels = [[
    // - 1
  Sentence(ru: "Она идет", en: "She goes"),
  Sentence(ru: "Он пойдет", en: "He will go"),
  Sentence(ru: "Я пойду", en: "I will go"),
  Sentence(ru: "Я вижу", en: "I see"),
  Sentence(ru: "Он видит", en: "He sees"),
  Sentence(ru: "Мы видели", en: "We saw"),
  Sentence(ru: "Она увидит", en: "She will see"),
  Sentence(ru: "Она не видела", en: "She didn't see"),
  Sentence(ru: "Она увидит?", en: "Will she see?"),
  Sentence(ru: "Она не увидит", en: "She won't see"),
  
  // - 2
  Sentence(ru: "Она видела", en: "She saw"),
  Sentence(ru: "Он видит?", en: "Does he see?"),
  Sentence(ru: "Он не видит. Она видит!", en: "He doesn't see. She sees!"),
  Sentence(ru: "Он видел", en: "Did he see?"),
  Sentence(ru: "Он не видел и он не увидит", en: "He didn't see and he won't see"),
  Sentence(ru: "Он продает?", en: "Does he sell?"),
  Sentence(ru: "Он не продает", en: "He doesn't sell"),
  Sentence(ru: "Он продал, они не продали", en: "He sold, they didn't sell"),
  Sentence(ru: "Они продают?", en: "Do they sell?"),
  Sentence(ru: "Они продают и я продаю", en: "They sell and I sell"),
  
  // - 3
//  Sentence(ru: "Она продает тоже", en: "She sells too"),
//  Sentence(ru: "", en: ""),
//  Sentence(ru: "", en: ""),
//  Sentence(ru: "", en: ""),
//  Sentence(ru: "", en: ""),
//  Sentence(ru: "", en: ""),
//  Sentence(ru: "", en: ""),
//  Sentence(ru: "", en: ""),
//  Sentence(ru: "", en: ""),
//  Sentence(ru: "", en: ""),
  
  // - 4
//   Sentence(ru: "", en: ""),
//   Sentence(ru: "", en: ""),
//   Sentence(ru: "", en: ""),
//   Sentence(ru: "", en: ""),
//   Sentence(ru: "", en: ""),
//   Sentence(ru: "", en: ""),
//   Sentence(ru: "", en: ""),
//   Sentence(ru: "", en: ""),
//   Sentence(ru: "", en: ""),
//   Sentence(ru: "", en: ""),
   
   // - 5
//    Sentence(ru: "", en: ""),
//    Sentence(ru: "", en: ""),
//    Sentence(ru: "", en: ""),
//    Sentence(ru: "", en: ""),
//    Sentence(ru: "", en: ""),
//    Sentence(ru: "", en: ""),
//    Sentence(ru: "", en: ""),
//    Sentence(ru: "", en: ""),
//    Sentence(ru: "", en: ""),
//    Sentence(ru: "", en: ""),
 ]]
}

//// -
//Sentence(ru: "", en: ""),
//Sentence(ru: "", en: ""),
//Sentence(ru: "", en: ""),
//Sentence(ru: "", en: ""),
//Sentence(ru: "", en: ""),
//Sentence(ru: "", en: ""),
//Sentence(ru: "", en: ""),
//Sentence(ru: "", en: ""),
//Sentence(ru: "", en: ""),
//Sentence(ru: "", en: ""),

