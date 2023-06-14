//
//  MockData.swift
//  land_marks
//
//  Created by Kara Zu.  L. on 2023/6/12.
//  Copyright © 2023 Kara Zu.  L. All rights reserved.
//

import Foundation

struct LandMark : Identifiable, Hashable, Codable{
    let id = UUID()
    var name:String
    var locationCity:String
    var locationContry:String
    var imagePath:String
    var isFavorite:Bool=false
    var latitude:Double
    var longtitude:Double
    var catagory:String
}
