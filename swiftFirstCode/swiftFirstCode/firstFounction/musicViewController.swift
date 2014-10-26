//
//  musicViewController.swift
//  swiftFirstCode
//
//  Created by dukai on 14-10-22.
//  Copyright (c) 2014年 dk. All rights reserved.
//

import UIKit
import AVFoundation

enum  encodingTypes:Int {
    
   case ENC_AAC  = 1,
        ENC_ALAC = 2,
        ENC_IMA4 = 3,
        ENC_ILBC = 4,
        ENC_ULAW = 5,
        ENC_PCM  = 6
};

class musicViewController: UIViewController {
    
    var audioPlayer:AVAudioPlayer?
    var audioRecorder:AVAudioRecorder?
    var recordEncoding:encodingTypes?
    
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
        
        recordEncoding = encodingTypes.ENC_AAC

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
    
    //开始录音
    @IBAction func startRecording(sender:UIButton){
        //创建音频会话对象
        var audioSession = AVAudioSession.sharedInstance()
        audioSession.setCategory(AVAudioSessionCategoryRecord, error: nil)
        
        var recordSettings = [:]
         var formatObject:NSNumber?
        if recordEncoding == encodingTypes.ENC_PCM
        {
            recordSettings = [
                AVFormatIDKey             : kAudioFormatLinearPCM,
                AVSampleRateKey           : 44100.0,
                AVNumberOfChannelsKey     : 2,
                AVLinearPCMBitDepthKey    : 16,
                AVLinearPCMIsBigEndianKey : false,
                AVLinearPCMIsFloatKey     : false
            ]
        }else{
            
            if recordEncoding == encodingTypes.ENC_AAC{
                formatObject =  kAudioFormatMPEG4AAC
            }else if recordEncoding == encodingTypes.ENC_ALAC{
                formatObject = kAudioFormatAppleLossless
            }else if recordEncoding == encodingTypes.ENC_IMA4{
                formatObject = kAudioFormatAppleIMA4
            }else if recordEncoding == encodingTypes.ENC_ILBC{
                formatObject = kAudioFormatiLBC
            }else if recordEncoding == encodingTypes.ENC_ULAW{
                formatObject = kAudioFormatULaw
            }else {
                formatObject = kAudioFormatAppleIMA4
            }
            
        }
        
        recordSettings = [
            AVFormatIDKey             : kAudioFormatMPEG4AAC,
            AVSampleRateKey           : 44100.0,
            AVNumberOfChannelsKey     : 2,
            AVLinearPCMBitDepthKey    : 16,
          //  AVEncoderBitRateKey       : 12800,
            AVEncoderAudioQualityKey  : NSNumber(int: 4)
        ]

        
        //根据日期 随机名字
       var dateformat = NSDateFormatter()
        dateformat.dateFormat = "yyyyMMddHHmmss"
        var locationString = dateformat.stringFromDate(NSDate().dateByAddingTimeInterval( NSTimeIntervalSince1970))
        locationString = "record\(locationString).aac"
        
        var path:String = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,NSSearchPathDomainMask.UserDomainMask, true)[0] as String
        path += "/\(locationString)"
        
        if NSFileManager.defaultManager().fileExistsAtPath(path)
        {
            var alert = UIAlertView(title: "文件已存在", message: "请从新录音", delegate: nil, cancelButtonTitle: "确定")
            alert.show()
            
            return
            
        }
            
           NSFileManager.defaultManager().createDirectoryAtPath(path, withIntermediateDirectories: true, attributes: nil, error: nil)
       
        var error : NSError?
            audioRecorder = AVAudioRecorder(URL: NSURL(fileURLWithPath: path) , settings: recordSettings, error: &error)
            
            if audioRecorder?.prepareToRecord() == true
            {
               
                println("recoding")
            }
     var bool =  audioRecorder?.record()
     }
        
    

}
