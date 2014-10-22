//
//  userInterfaceViewController.swift
//  swiftFirstCode
//
//  Created by dukai on 14-10-22.
//  Copyright (c) 2014年 dk. All rights reserved.
//

import UIKit

class userInterfaceViewController: UIViewController,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource,UITextViewDelegate,UIActionSheetDelegate {
    var naviTitle :String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor();
        var backButton = UIBarButtonItem(title: "back", style: UIBarButtonItemStyle.Plain, target: self, action: "back")
        self.navigationItem.leftBarButtonItem = backButton
        
        self.title = self.naviTitle
        
        if self.title == "UILabel"
        {
            var label = UILabel(frame: CGRectMake(10, 160, 100, 30))
            label.font = UIFont.systemFontOfSize(15.0)
            label.textAlignment = NSTextAlignment.Center;
            label.backgroundColor = UIColor.blackColor()
            label.text = "lalala"
            label.textColor = UIColor.yellowColor()
            self.view .addSubview(label)
            
        }
        if self.title == "UIButton"
        {
            var btn = UIButton.buttonWithType(UIButtonType.System) as UIButton
            btn.frame = CGRectMake(120, 160, 70, 30)
            btn.setTitle("button", forState: UIControlState.Normal)
            btn.backgroundColor = UIColor.purpleColor()
            btn.setTitleColor(UIColor.yellowColor(), forState: UIControlState.Normal)
            btn.addTarget(self, action:"buttonAction:" , forControlEvents: UIControlEvents.TouchUpInside)
            btn.tag = 1
            self.view .addSubview(btn)
            
        }
        if(self.title == "UIImageView")
        {
            var imageView = UIImageView(image: UIImage(named: "11.jpg"))
            imageView.frame = self.view.bounds
            imageView.contentMode = UIViewContentMode.ScaleAspectFit
            self.view.addSubview(imageView)
            
            var urlImage = UIImage(data: NSData(contentsOfURL: NSURL(string: "http://c.hiphotos.baidu.com/image/w%3D310/sign=701107a80ff431adbcd245387b37ac0f/9825bc315c6034a89c795abbc813495409237675.jpg")))
            imageView.image = urlImage
        }
        if(self.title == "UISlider")
        {
            var slider = UISlider(frame: CGRectMake(10, 300, 300, 30))
            slider.setMinimumTrackImage( UIImage(named: "11.jpg"), forState: UIControlState.Normal)
            slider.maximumValueImage = UIImage(named: "xiaolian")
            slider.minimumValueImage = UIImage(named: "xiaolian")
            slider.setMaximumTrackImage(UIImage(named: "xiaolian"), forState: UIControlState.Normal)
            slider.thumbImageForState( UIControlState.Normal)
            slider.setThumbImage( UIImage(named: "xiaolian"), forState: UIControlState.Normal)
            var value:Float = slider.value
            println("aaa \(value)")
            self.view.addSubview(slider)
        }
        if(self.title == "UIWebView")
        {
            var webView = UIWebView(frame: self.view.bounds)
            var urlRequest = NSURLRequest(URL: NSURL(string: "http://www.baidu.com"))
            webView.loadRequest(urlRequest)
            self.view.addSubview(webView)
        }
        if(self.title == "UISegmentedControl")
        {
            var segmentControl = UISegmentedControl(items: ["first","secend","third","forth"])
            segmentControl.frame = CGRectMake(20, 300, 200, 30)
            self.view.addSubview(segmentControl)
            
            segmentControl.insertSegmentWithTitle("five", atIndex: 4, animated: true)
            segmentControl.momentary = true  //default is flase , if bool is ture , the animated of selected is cencel
            
        }
        if(self.title == "UISwitch")
        {
            var switchView = UISwitch(frame: CGRectMake(200, 300, 200, 30))
            switchView.onTintColor = UIColor.brownColor()
            switchView.tintColor = UIColor.blackColor()
            switchView.thumbTintColor = UIColor.blueColor()
            switchView.setOn(true, animated: true) //on type
            self.view.addSubview(switchView)
        }
        if(self.title == "UITextField")
        {
            var TextField = UITextField(frame: CGRectMake(100, 300, 200, 30))
            TextField.text = "textField"
            TextField.placeholder = "please enter some thing"
            TextField.borderStyle = UITextBorderStyle.RoundedRect
            TextField.delegate = self
            self.view.addSubview(TextField)
        }
        if(self.title == "UIScrollView")
        {
            var ScrollView = UIScrollView(frame: self.view.bounds)
            ScrollView.pagingEnabled = true
            ScrollView.contentSize.width = 320*2
            self.view.addSubview(ScrollView)
            
            var aimageArr:[String] = []
            
            for var i = 1; i<16 ; i++
            {
                var str = "flower"
                str += String(i)
                str += ".jpg"
                aimageArr.append(str)
            }
            for var i = 0 ; i<15 ; i++
            {
                var imageView = UIImageView(frame: CGRectMake(self.view.frame.width * CGFloat(i) , 0, self.view.frame.width, self.view.frame.height))
                imageView.image = UIImage(named: aimageArr[i] as NSString)
                ScrollView.addSubview(imageView)
                
            }
            ScrollView.contentSize.width = CGFloat(ScrollView.frame.width * CGFloat (aimageArr.count))
            
        }
        if(self.title == "UISearchBar")
        {
            var searchBar = UISearchBar(frame: CGRectMake(20, 300, 300, 30))
            searchBar.placeholder = "please enter condition of search"
            searchBar.showsCancelButton = true
            self.view.addSubview(searchBar)
        }
        if(self.title == "UIPageControl")
        {
            var pageControl = UIPageControl(frame: CGRectMake(100, 300, 100, 20))
            pageControl.numberOfPages = 4
            pageControl.pageIndicatorTintColor = UIColor.blackColor()
            pageControl.currentPageIndicatorTintColor = UIColor.redColor()
            self.view.addSubview(pageControl)
            
        }
        if(self.title == "UIDatePicker")
        {
            var datePicker = UIDatePicker(frame: CGRectMake(50, 300, 280, 200))
            datePicker.datePickerMode = UIDatePickerMode.DateAndTime
            self.view.addSubview(datePicker)
        }
        if(self.title == "UIPickerView")
        {
            var pickerView = UIPickerView(frame: CGRectMake(10, 300, 280, 200))
            pickerView.delegate = self
            pickerView.dataSource = self
            self.view.addSubview(pickerView)
        }
        if(self.title == "UIProgressView")
        {
            var progressView = UIProgressView(progressViewStyle: UIProgressViewStyle.Default)
            progressView.frame = CGRectMake(20, 200, 300, 30)
            self.view.addSubview(progressView)
            progressView.setProgress(20, animated: true)
        }
        if(self.title == "UITextView")
        {
            var textView = UITextView(frame: CGRectMake(40, 200, 300, 200))
            textView.textColor = UIColor.blackColor()
            textView.text = "this is a textView"
            textView.editable = true
            textView.delegate = self
            textView.layer.borderWidth = 1
            self.view.addSubview(textView)
        }
        if(self.title == "UIToolbar")
        {
            var items:[UIButton] = []
            var flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
            var barButtonItemA = UIBarButtonItem(title: "A", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
            var barButtonItemB = UIBarButtonItem(title: "B", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
            var barButtonItemC = UIBarButtonItem(title: "C", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
            var barButtonItemD = UIBarButtonItem(title: "D", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
            
            var toolBar = UIToolbar(frame: CGRectMake(20, 200, 300, 30))
            toolBar.setItems([flexibleSpace,barButtonItemA,barButtonItemB,barButtonItemC,barButtonItemD,flexibleSpace], animated: true)
            self.view.addSubview(toolBar)
            
        }
        if(self.title == "UIActionSheet")
        {
            var actionSheet = UIActionSheet(title: "actinSheet", delegate: self, cancelButtonTitle: "cencel", destructiveButtonTitle: "1", otherButtonTitles: "2", "3")
            actionSheet.showInView(self.view)
        }
        if(self.title == "UIActivityIndicatorView")
        {
            var activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.Gray)
            activityIndicatorView.frame = CGRectMake(200, 300, 30, 30)
            self.view.addSubview(activityIndicatorView)
            activityIndicatorView.startAnimating()
        }
        
        //字典
        var allDic :[String:String] = ["first":"baidu","sec":"tengxun","third":"xinlang"]
        var str:String = ""
        var tempStr = allDic["first"]! as String
        str += "aaa \(tempStr)"
        println("\(str)")
        
    }
    func buttonAction(sender:UIButton)
    {
        println("btn.tag = \(sender.tag)")
    }
    func back(){
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    //textfield delegate
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        return true
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //actionSheet delegate
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        
    }
    func actionSheetCancel(actionSheet: UIActionSheet) {
        
    }
    
    //textView delegate
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        
        if text == "\n"
        {
            textView.editable = false
        }
        textView.editable = true
        return true
    }
    
    //UIpickerView delegate
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
        return 3
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return 5
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String!
    {
        return "lalala"
    }
}