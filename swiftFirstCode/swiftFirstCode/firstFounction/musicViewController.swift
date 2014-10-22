//
//  musicViewController.swift
//  swiftFirstCode
//
//  Created by dukai on 14-10-22.
//  Copyright (c) 2014年 dk. All rights reserved.
//

import UIKit
import AVFoundation
class musicViewController: UIViewController {
    
    var audioPlayer:AVAudioPlayer?
    
    @IBOutlet  var planSlider:UISlider?
    @IBOutlet  var voiceSlider:UISlider?
    @IBOutlet var swich:UISwitch?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var musicPath:String = NSBundle.mainBundle().pathForResource("花木兰", ofType:"mp3")!
        var musicUrl = NSURL(fileURLWithPath: musicPath)
        audioPlayer = AVAudioPlayer(contentsOfURL: musicUrl, error: nil)
        
        voiceSlider?.minimumValue = 0.0
        voiceSlider?.maximumValue = 10.0
        
        voiceSlider?.value = 5

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func Play(sender:UIButton){
        sender.selected = !sender.selected
        if sender.selected == true
        {
            audioPlayer?.play()
        }else{
            audioPlayer?.pause()
        }
        
    }
    @IBAction func stop(){
        
        audioPlayer?.stop()
    }
    @IBAction func Recycle(){
        
    }
    @IBAction func changVoice(){
        
        audioPlayer!.volume = voiceSlider!.value
        
    }

}
