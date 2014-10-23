//
//  TableViewController.swift
//  swiftFirstCode
//
//  Created by dukai on 14-10-22.
//  Copyright (c) 2014年 dk. All rights reserved.
//

import UIKit

class TableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var tableView : UITableView?
    var items : NSArray?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var rightBtn = UIBarButtonItem(title: "more...", style: UIBarButtonItemStyle.Plain, target: self, action: "moreAct")
        self.navigationItem.rightBarButtonItem = rightBtn
        
        
        self.tableView = UITableView(frame: CGRectMake(0, 0, screen_width, screen_hight-65), style: UITableViewStyle.Plain)
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        self.view .addSubview( self.tableView! )
        
        self.title = "swift"
        self.items = ["UILabel", "UIButton", "UIImageView", "UISlider", "UIWebView", "UISegmentedControl", "UISwitch", "UITextField", "UIScrollView", "UISearchBar", "UIPageControl", "UIDatePicker", "UIPickerView", "UIProgressView", "UITextView", "UIToolbar", "UIActionSheet", "UIActivityIndicatorView"]

    }
   
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.items!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("cell") as? UITableViewCell
        if cell == nil
        {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        }
        cell?.textLabel.text = self.items?.objectAtIndex(indexPath.row) as NSString
        
        return cell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return 50.0
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        var controller = userInterfaceViewController()
        controller.naviTitle = self.items!.objectAtIndex(indexPath.row) as? NSString
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    
    func moreAct(){
        
        println("more.....")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
