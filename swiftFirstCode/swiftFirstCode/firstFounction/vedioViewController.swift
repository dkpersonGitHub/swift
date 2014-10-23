//
//  vedioViewController.swift
//  swiftFirstCode
//
//  Created by dukai on 14/10/23.
//  Copyright (c) 2014年 dk. All rights reserved.
//

import UIKit
import MediaPlayer

class vedioViewController: UIViewController {
  
    var vedioPlayer:MPMoviePlayerController?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var path:String = NSBundle.mainBundle().resourcePath!
        path += "/倒带.mp4"
        var pathUrl = NSURL .fileURLWithPath(path)
        vedioPlayer = MPMoviePlayerController(contentURL: pathUrl)
        vedioPlayer?.view.backgroundColor = UIColor.blackColor()
        vedioPlayer?.scalingMode = MPMovieScalingMode.AspectFit
        
        vedioPlayer?.view.frame = CGRectMake(0, 100, screen_width, 200)
        vedioPlayer?.fullscreen = true
        
        self.view.addSubview(vedioPlayer!.view)
       
    }
    @IBAction func play()
    {
         vedioPlayer?.play()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
