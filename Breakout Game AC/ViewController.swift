//
//  ViewController.swift
//  Breakout Game AC
//
//  Created by A.M. Student on 11/7/19.
//  Copyright © 2019 A.M. Student. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var ComradButton: UIButton!
    @IBOutlet weak var BackgroundImage: UIImageView!
    @IBOutlet weak var ComradFacadeImage: UIImageView!
    
    var audioPlayer: AVAudioPlayer?
    var timer: Timer?
    var timer2: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Music V
        guard let path = Bundle.main.path(forResource: "National Anthem of USSR", ofType: "wav")
            else { return }
        let url = URL(fileURLWithPath: path)
        audioPlayer = try? AVAudioPlayer(contentsOf: url, fileTypeHint: nil)
        audioPlayer?.prepareToPlay()
        audioPlayer?.setVolume(2, fadeDuration: 0.1)
        audioPlayer?.play()
        // Music ^
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { timer in
            self.action2Title = "Dont Allow"
            self.alertTitle = "Breakout Game AC Would Like To Send You Notifications"
            self.alertMessage = "Allow?"
            self.actionTitle = "Allow"
            self.alertHappen()
        }
        
        timer2 = Timer.scheduledTimer(withTimeInterval: 4, repeats: false) {
            timer in
            
                self.action2Title = "Dont Allow"
                self.alertTitle = "Breakout Game AC Would Like Access to Your Location"
                self.alertMessage = "Allow?"
                self.actionTitle = "Allow"
                self.alertHappen()
        }
       
//            action2Title = "Dont Allow"
//            self.alertTitle = "Breakout Game AC Would Like To Send You Notifications"
//            self.alertMessage = "Allow?"
//            self.actionTitle = "Allow"
//            alertHappen()
       
        
    }
    
    var action2Title: String = "..."
    
    // Alert Base Values V
    var alertTitle: String = "alertTitle Failed"
    var alertMessage: String = "alertMessage Failed"
    var actionTitle: String = "actionTitle Failed"
    
    var hitComradIntUp: Int = 0
    // Alert Base Values ^
    
    func alertHappen() {
    let action = UIAlertAction(title: actionTitle, style: .default, handler: nil)
    
    let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
    
    let action2 = UIAlertAction(title: action2Title, style: .default, handler: nil)
    
    alert.addAction(action)
    alert.addAction(action2)
    
    present(alert, animated: true, completion: nil)
    
    action2Title = "..."
        
    }
    
    @IBAction func showAlertHitComrad() {
        
        hitComradIntUp += 1
        
        if(hitComradIntUp == 1) {
            self.alertTitle = "85%"
            self.alertMessage = "Hey, Comrad, thats not nice"
            self.actionTitle = "..."
            }
        if(hitComradIntUp == 2) {
            self.alertTitle = "70%"
            self.alertMessage = "Woah Comrad, if you keep this up I'll start BREAKING things! I've already BROKEN the fourth wall!"
            self.actionTitle = "..."
            }
        if(hitComradIntUp == 3) {
            self.alertTitle = "55%"
            self.alertMessage = "Thats it, I'm BREAKING the background"
            self.actionTitle = "..."
            BackgroundImage.image = UIImage(named: "")
            }
        if(hitComradIntUp == 5) {
            self.alertTitle = "40%"
            self.alertMessage = "Thats it, you BROKE me, I'm taking off this label! If you BREAK me any more, I'm BREAKING OUT of this game!"
            self.actionTitle = "..."
            ComradFacadeImage.image = UIImage(named: "MC Cracked Stone Bricks Flat")
        }
        if(hitComradIntUp == 6) {
            self.alertTitle = "25%"
            self.alertMessage = "I'm taking the music away!"
            self.actionTitle = "..."
            audioPlayer?.stop()
        }
        if(hitComradIntUp == 7) {
            self.alertTitle = "10%"
            self.alertMessage = "Do it again! I'm warning you!"
            self.actionTitle = "..."
        }
        if(hitComradIntUp == 8) {
            self.alertTitle = "0.0001%"
            self.alertMessage = "You are not my comrad."
            self.actionTitle = "..."
            sleep(1)
            exit(1)
        }
        if(hitComradIntUp == 0) {
            self.alertTitle = "REEEE"
            self.alertMessage = "REEE"
            self.actionTitle = "..."
            }
        
        alertHappen()
        
    }
    
}

