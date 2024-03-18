//
//  AppModel.swift
//  MarsLen
//
//  Created by Simon Fong on 17/03/2024.
//

import Foundation
import UIKit

/// A data model of photo list to decode Json
class photoModel: Codable{
    var photos:[photosObj]?
    
    class photosObj:Codable{
        var sol: Int
        var img_src:String
        var earth_date:String
        var camera:cameraObj
    }
    
    class cameraObj:Codable{
        var name:String
        var full_name:String
    }
}

/// A data model of rover info to decode Json
class roverModel: Codable{
    var photo_manifest: manifestObj?
    
    class manifestObj:Codable{
        var name:String?
        var landing_date:String?
        var launch_date:String?
        var status:String?
        var max_sol:Int?
        var max_date:String?
        var total_photos:Int?
    }
}

/// A model of this app
class AppModel: ObservableObject{
    
    let cam_list:[String] = ["FHAZ", "RHAZ", "NAVCAM"]
    let rover_list:[Rover] = [
        Rover(
            name: "Curiosity",
            metaData: [
                MetaData(id: 0, key: "STATUS", value: "ACTIVE", logo: "checkmark.circle"),
                MetaData(id: 1, key: "MAX SOL", value: "4126", logo: "flame"),
                MetaData(id: 2, key: "LAUNCH", value: "Nov. 26, 2011", logo: "arrow.up.circle"),
                MetaData(id: 3, key: "LANDING", value: "Aug. 6, 2012", logo: "arrow.down.circle"),
            ]
        ),
        
        Rover(
            name: "Opportunity",
            metaData: [
                MetaData(id: 0, key: "STATUS", value: "MISSION END", logo: "checkmark.circle" ),
                MetaData(id: 1, key: "MAX SOL", value: "5498", logo: "flame"),
                MetaData(id: 2, key: "LAUNCH", value: "Jul. 7, 2003", logo: "arrow.up.circle"),
                MetaData(id: 3, key: "LANDING", value: "Jan. 24, 2004", logo: "arrow.down.circle"),
            ]
        ),
        Rover(
            name: "Spirit",
            metaData: [
                MetaData(id: 0, key: "STATUS", value: "MISSION END", logo: "checkmark.circle"),
                MetaData(id: 1, key: "MAX SOL", value: "2208", logo: "flame"),
                MetaData(id: 2, key: "LAUNCH", value: "Jun. 10, 2003", logo: "arrow.up.circle"),
                MetaData(id: 3, key: "LANDING", value: "Jan. 3, 2004", logo: "arrow.down.circle"),
            ]
        ),
        
    ]
    
    let D3_list:[String] = ["spirit_3d.usdz","spirit_3d.usdz","spirit_3d.usdz"]
    var currentIndex:Int = 0
    
    
    /// Function to decode Json into target type
    func decodePhotoJson(data:Data)-> photoModel{
        return try! JSONDecoder().decode(
            photoModel.self,
            from: data
        )
    }
    
    /// Function to decode Json into target type
    func decodeRoverJson(data:Data)-> roverModel{
        return try! JSONDecoder().decode(
            roverModel.self,
            from: data
        )
    }
    
    /// Function to convert data into UIImage
    func toImage(data:Data)-> UIImage?{
        return UIImage(data:data)
    }
}

class MetaData{
    var id : Int
    var key : String
    var value : String
    var logo : String
    
    init(id: Int, key: String, value: String, logo: String) {
        self.id = id
        self.key = key
        self.value = value
        self.logo = logo
    }
    
}


class Rover{
    var name:String
    var metaData:[MetaData]
    
    init(name: String, metaData:[MetaData]) {
        self.name = name
        self.metaData = metaData
    }
}



