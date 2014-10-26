//
//  baseViewController.swift
//  swiftFirstCode
//
//  Created by dukai on 14/10/26.
//  Copyright (c) 2014年 dk. All rights reserved.
//

import UIKit

class baseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var array = [] //空数组
        var arrayNil = [String]() //限制string类型的  空数组
        
        var array1:[String] = ["a","b"] //限制 成员必须是字符串
        
        var array2 = ["2","1"]
        
        array2 += ["1"] //加元素
        array2.append("2") //同上
        array2.insert("3", atIndex: 1) //插入
        array2[1...3] = ["d","e"] //替换 位置1 和3 的元素为d e
        var str = array2[0]
        
        for item in array2[1...3] //快速遍历 1到3之间位置 的元素
        {
            
        }
        array2.removeAtIndex(0) //移除
        array2.removeAll(keepCapacity: true)

        
        var dic3 = ["三国演义":"罗贯中","水浒传":"施耐庵","红楼梦":"曹雪芹","西游记":"吴承恩"]
        var dic = [:]
        var dic1 = [String:String]()
        
        var str1 = dic3["三国演义"]!
        dic3.updateValue("aaa", forKey: "水浒传")
        dic3["郭德纲相声选"] = "郭德纲"
        dic3.removeValueForKey("西游记")
        dic3.removeAll(keepCapacity: true)
        
        for (key,value) in dic3
        {
            
        }
        
        for item in dic3
        {
            item.0 //键
            item.1 //值
        }
        
        for item in dic3.values //只取字典里的值
        {
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
