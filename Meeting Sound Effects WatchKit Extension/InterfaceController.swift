//
//  InterfaceController.swift
//  Meeting Sound Effects WatchKit Extension
//
//  Created by diego gagliardo on 19/04/2017.
//  Copyright © 2017 gagliardo. All rights reserved.
//

import WatchKit
import Foundation
import AVFoundation


class InterfaceController: WKInterfaceController {
    
    var btnSadTrombone: AVAudioPlayer!
    var btnWC: AVAudioPlayer!
    var btnBaDumTish: AVAudioPlayer!
    var btnTaDa: AVAudioPlayer!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        // Set the paths for the WAV files
        let pathSadTrombone = Bundle.main.path(forResource: "sad-trombone", ofType: "wav")
        let pathWC = Bundle.main.path(forResource: "wc", ofType: "wav")
        let pathBaDumTish = Bundle.main.path(forResource: "ba-dum-tish", ofType: "wav")
        let pathTaDa = Bundle.main.path(forResource: "TaDa", ofType: "wav")
        
        let soundURLSadTrombone = URL(fileURLWithPath: pathSadTrombone!)
        let soundURLWC = URL(fileURLWithPath: pathWC!)
        let soundURLBaDumTish = URL(fileURLWithPath: pathBaDumTish!)
        let soundURLTaDa = URL(fileURLWithPath: pathTaDa!)
        
        // Prepare the buttons to play, or get an error
        do {
            try btnSadTrombone = AVAudioPlayer(contentsOf: soundURLSadTrombone)
            btnSadTrombone.prepareToPlay()
            try btnWC = AVAudioPlayer(contentsOf: soundURLWC)
            btnWC.prepareToPlay()
            try btnBaDumTish = AVAudioPlayer(contentsOf: soundURLBaDumTish)
            btnBaDumTish.prepareToPlay()
            try btnTaDa = AVAudioPlayer(contentsOf: soundURLTaDa)
            btnTaDa.prepareToPlay()
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    // Call the play actions
    
    @IBAction func sadtrombonePressed(sender: WKInterfaceButton) {
        playSadTrombone()
    }
    
    @IBAction func wcPressed(sender: WKInterfaceButton) {
        playWC()
    }
    
    @IBAction func badumtishPressed(sender: WKInterfaceButton) {
        playBaDumTish()
    }
    
    @IBAction func tadaPressed(sender: WKInterfaceButton) {
        playTaDa()
    }
    
    // Define the Play funtions
    
    func playSadTrombone() {
        if btnSadTrombone.isPlaying {
            btnSadTrombone.stop()
        }
        btnSadTrombone.play()
    }
    
    func playWC() {
        if btnWC.isPlaying {
            btnWC.stop()
        }
        btnWC.play()
    }
    
    func playBaDumTish() {
        if btnBaDumTish.isPlaying {
            btnBaDumTish.stop()
        }
        btnBaDumTish.play()
    }
    
    func playTaDa() {
        if btnTaDa.isPlaying {
            btnTaDa.stop()
        }
        btnTaDa.play()
    }
    
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
}
