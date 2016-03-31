//
//  ViewController.swift
//  RealmSwiftNewDemo
//
//  Created by ying on 16/3/30.
//  Copyright © 2016年 ying. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //
        let realm = try! Realm()
        //
        let items = realm.objects(ConsumeItem)
        //
        if items.count > 0 {
            return
        }
        
        //
        let type1 = ConsumeType()
        type1.name = "购物"
        let type2 = ConsumeType()
        type2.name = "娱乐"
        
        //
        let item1 = ConsumeItem(value: ["买一台电脑", 5999.0, NSDate(), type1])
        
        let item2 = ConsumeItem()
        item2.name = "看一场电影"
        item2.cost = 25
        item2.date = NSDate(timeIntervalSinceNow: -36000)
        item2.type = type2
        
        let item3 = ConsumeItem()
        item3.name = "买一碗牛肉面"
        item3.cost = 2.5
        item3.date = NSDate(timeIntervalSinceNow: -72000)
        item3.type = type1
        
        //
        try! realm.write {
            realm.add(item1)
            realm.add(item2)
            realm.add(item3)
        }
        
        //
        print(realm.path)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

