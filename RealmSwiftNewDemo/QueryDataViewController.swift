//
//  QueryDataViewController.swift
//  RealmSwiftNewDemo
//
//  Created by ying on 16/4/1.
//  Copyright © 2016年 ying. All rights reserved.
//

import UIKit
import RealmSwift

class QueryDataViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var dformatter = NSDateFormatter()
    
    var consumeItems: Results<ConsumeItem>?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dformatter.dateFormat = "MM月dd日 HH:MM"
        tableView.delegate = self
        tableView.dataSource = self
        //创建可重用单元格
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        //使用默认的数据库
        let realm = try! Realm()
        //查询所有的消费记录
        consumeItems = realm.objects(ConsumeItem)
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return consumeItems!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //同一形式单元格重复使用，在声明时已注册
        let cell = UITableViewCell(style: .Value1, reuseIdentifier: "MyCell")
        let item = consumeItems![indexPath.row]
        cell.textLabel?.text = item.name + " ¥" + String(format: "%.1f", item.cost)
        cell.detailTextLabel?.text = dformatter.stringFromDate(item.date)
        return cell
    }

}
