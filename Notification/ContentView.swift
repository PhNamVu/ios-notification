//
//  ContentView.swift
//  Notification
//
//  Created by Nam Vu on 21/11/2021.
//

import UIKit
import SwiftUI
import AVKit
import AudioToolbox

class SoundManager {
    
    static let instance = SoundManager()
    var player : AVAudioPlayer?
    
    func playSound(){
        guard let url = Bundle.main.url(forResource: "bell", withExtension: ".mp3") else { return }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }
        
    }
    
    
}

class HapticManager {
    
    static let instance = HapticManager() // Singleton
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType){
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact (style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}

struct ContentView: View {
    
    var soundManager = SoundManager()
    
    var body: some View {
        VStack(spacing: 40) {
            Button ("Play sound") {
                SoundManager.instance.playSound()
            }
            Button ("Vibrate success") { HapticManager.instance.notification(type:.success)
            }
        
            Button("Vibrate heavy") { HapticManager.instance.impact(style:.heavy) }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
