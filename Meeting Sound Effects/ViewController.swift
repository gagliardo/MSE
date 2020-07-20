//
//  ViewController.swift
//  Meeting Sound Effects
//
//  Created by diego gagliardo on 19/04/2017.
//  Copyright © 2017 gagliardo. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var btnSadTrombone: AVAudioPlayer!
    var btnWC: AVAudioPlayer!
    var btnBaDumTish: AVAudioPlayer!
    var btnTaDa: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
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
    
    @IBAction func sadtrombonePressed(sender:
        UIButton) {
        playSadTrombone()
    }
    
    @IBAction func wcPressed(sender: UIButton) {
        playWC()
    }
    
    @IBAction func badumtishPressed(sender: UIButton) {
        playBaDumTish()
    }
    
    @IBAction func tadaPressed(sender: UIButton) {
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
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

