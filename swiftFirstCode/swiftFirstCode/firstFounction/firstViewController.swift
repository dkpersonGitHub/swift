//
//  firstViewController.swift
//  swiftFirstCode
//
//  Created by dukai on 14-10-21.
//  Copyright (c) 2014年 dk. All rights reserved.
//

import UIKit

class firstViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
    }

    @IBAction func pushTableView(){
        
        var controller = TableViewController(nibName: "TableViewController", bundle: nil)
        self.navigationController?.pushViewController(controller, animated: true)
    }
    @IBAction func pushMusicView(){
        
        var controller = musicViewController(nibName: "musicViewController", bundle: nil)
        self.navigationController?.pushViewController(controller, animated: true)
    }
    @IBAction func pushVedioView(){
        
        var controller = vedioViewController(nibName: "vedioViewController", bundle: nil)
        self.navigationController?.pushViewController(controller, animated: true)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
