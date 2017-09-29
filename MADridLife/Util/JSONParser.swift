//
//  JSONParser.swift
//  MADridLife
//
//  Created by Rodrigo Limpias Cossio on 23/9/17.
//  Copyright © 2017 Rodrigo Limpias Cossio. All rights reserved.
//

import Foundation

func parseShops(data: Data) -> Shoptivities{
    let shops = Shoptivities()
    do {
        let jsonObject = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! Dictionary<String, Any>
        let result = jsonObject["result"] as! [Dictionary<String, Any>]
        
        for shopJson in result{
            let shop = Shoptivity(name: shopJson["name"]! as! String)
            shop.address = shopJson["address"]! as! String
            shop.logo = shopJson["logo_img"] as! String
            shop.image = shopJson["img"] as! String
            shop.description_en = shopJson["description_en"] as! String
            shop.description_es = shopJson["description_es"] as! String
            shop.openingHours_en = shopJson["opening_hours_en"] as! String
            shop.openingHours_es = shopJson["opening_hours_es"] as! String
            shop.latitude = (shopJson["gps_lat"] as! NSString).floatValue
            shop.longitude = (shopJson["gps_lon"] as! NSString).floatValue
            shop.type = "shop"
            
            shops.add(shoptivity: shop)
        }
    } catch {
        
    }
    return shops
}

func parseActivities(data: Data) -> Shoptivities{
    let activities = Shoptivities()
    do {
        let jsonObject = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! Dictionary<String, Any>
        let result = jsonObject["result"] as! [Dictionary<String, Any>]
        
        for activityJson in result{
            let activity = Shoptivity(name: activityJson["name"]! as! String)
            activity.address = activityJson["address"]! as! String
            activity.logo = activityJson["logo_img"] as! String
            activity.image = activityJson["img"] as! String
            activity.description_en = activityJson["description_en"] as! String
            activity.description_es = activityJson["description_es"] as! String
            activity.openingHours_en = activityJson["opening_hours_en"] as! String
            activity.openingHours_es = activityJson["opening_hours_es"] as! String
            activity.latitude = (activityJson["gps_lat"] as! NSString).floatValue
            activity.longitude = (activityJson["gps_lon"] as! NSString).floatValue
            activity.type = "activity"
            
            activities.add(shoptivity: activity)
        }
    } catch {
        
    }
    return activities
}



