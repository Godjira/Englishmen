//
//  SpeechManager.swift
//  Englishman
//
//  Created by Godjira on 12/15/20.
//  Copyright © 2020 Godjira. All rights reserved.
//

import Foundation
import AVFoundation

class SpeechManager: NSObject, AVSpeechSynthesizerDelegate {
    
    static let shared = SpeechManager()
    
    typealias CompletionHandler = () -> Void
    
    var completion: CompletionHandler?
    
    let enVoice = AVSpeechSynthesisVoice(language: "en-GB")
    let ruVoice = AVSpeechSynthesisVoice(language: "ru-GB")
    
    let uDefault = UserDefaults.standard
    
    var ruRate: Float {
        get { uDefault.float(forKey: "voice_rate_ru") }
        set { uDefault.set(newValue, forKey: "voice_rate_ru") }
    }
    
    var enRate: Float {
        get { uDefault.float(forKey: "voice_rate_en") }
        set { uDefault.set(newValue, forKey: "voice_rate_en") }
    }
    
    let synthesizer = AVSpeechSynthesizer()
    
    func configurate() {
        ruRate = 0.4
        enRate = 0.1
        do{
            try AVAudioSession.sharedInstance().setCategory(.playback)
            do{
                try AVAudioSession.sharedInstance().setActive(true)
            }catch{
                
            }
        }catch{
            
        }
    }
    
    func say(_ sentence: Sentence, en: Bool = false, complition: @escaping CompletionHandler) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.synthesizer.speak(self.configureUtterance(sentence: sentence, en))
            if en { self.completion = complition }
        }
    }
    
    func configureUtterance(sentence: Sentence,_ voiceLangEng: Bool) -> AVSpeechUtterance {
        let utterance = AVSpeechUtterance(string: voiceLangEng == true ? sentence.en : sentence.ru)
        utterance.voice = voiceLangEng == true ? self.enVoice : self.ruVoice
        utterance.rate = voiceLangEng == true ? enRate : ruRate
        return utterance
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        if  completion != nil {
            completion!()
            self.completion = nil
        }
    }
    
}
