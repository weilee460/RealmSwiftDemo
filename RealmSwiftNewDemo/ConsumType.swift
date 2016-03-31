//
//  ConsumType.swift
//  RealmSwiftNewDemo
//
//  Created by ying on 16/3/30.
//  Copyright © 2016年 ying. All rights reserved.
//

import Foundation
import RealmSwift

class ConsumeType: Object {
    //类型名, dynamic? what's mean?
    dynamic var name = ""
}

class ConsumeItem: Object {
    //条目名
    dynamic var name = ""
    //金额
    dynamic var cost = 0.0
    //时间
    dynamic var date = NSDate()
    //所属消费类别
    dynamic var type: ConsumeType?
}
