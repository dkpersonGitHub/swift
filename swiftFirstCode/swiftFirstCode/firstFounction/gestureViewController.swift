//
//  gestureViewController.swift
//  swiftFirstCode
//
//  Created by dukai on 14/10/26.
//  Copyright (c) 2014年 dk. All rights reserved.
//

import UIKit

class gestureViewController: UIViewController {
    
    @IBOutlet var gestureLabel:UILabel?
    @IBOutlet var pinchGes:UIPinchGestureRecognizer?
    @IBOutlet var rotationGes:UIRotationGestureRecognizer?
    @IBOutlet var swipeGes:UISwipeGestureRecognizer?
    @IBOutlet var panGes:UIPanGestureRecognizer?
    @IBOutlet var screenEdgePanGes:UIScreenEdgePanGestureRecognizer?
    @IBOutlet var longPressGes:UILongPressGestureRecognizer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.createTapGesture(1) //创建单击实践 代码实现  单击一次
        self.createTapGesture(2) // 单击2次
    }

    func createTapGesture(var tapNum:Int){
        
        var tapGes = UITapGestureRecognizer(target: self, action: "tapAct:")
        self.gestureLabel?.addGestureRecognizer(tapGes)
        
        tapGes.numberOfTapsRequired = tapNum
        tapGes.numberOfTouchesRequired = 1
        
    }
    
    func tapAct(sender:UITapGestureRecognizer){
        if sender.numberOfTapsRequired == 1
        {
            self.gestureLabel?.text = "tapGesture once clip"
        }else if sender.numberOfTapsRequired == 2{
            self.gestureLabel?.text = "tapGesture double clip"
        }
        
    }
    
    //pinch 事件
    @IBAction func pinchAct(){
        
        self.gestureLabel?.text = "pinch gesture"
        var scale = self.pinchGes?.scale
        var velocity = self.pinchGes?.velocity
        
//        println("scale: \(scale)")
//        println("velocity\(velocity)")
    }
    @IBAction func rotationAct(){
        self.gestureLabel?.text = "rotation gesture"
        self.rotationGes?.rotation
        self.rotationGes?.velocity
    }
    @IBAction func swipeAct(){
        self.gestureLabel?.text = "swipe gesture"
        self.rotationGes?.rotation
        self.rotationGes?.velocity
    }
    @IBAction func panAct(){
        self.gestureLabel?.text = "pan gesture"
        self.rotationGes?.rotation
        self.rotationGes?.velocity
    }

    @IBAction func screenEdgePanAct(){
        self.gestureLabel?.text = "screenEdgePan gesture"
        self.rotationGes?.rotation
        self.rotationGes?.velocity
    }
    @IBAction func longPressAct(){
        self.gestureLabel?.text = "longPress gesture"
        
        var point:CGPoint = self.longPressGes!.locationInView(self.view)
        self.gestureLabel?.frame = CGRectMake(point.x, point.y,self.gestureLabel!.frame.size.width as CGFloat , self.gestureLabel!.frame.size.height as CGFloat)
        
    }

}
