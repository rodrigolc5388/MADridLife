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
            //shop.latitude = shopJson["gps_lat"] as! Float
            //shop.longitude = shopJson["gps_lon"] as! Float
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
        
        for activtyJson in result{
            let activity = Shoptivity(name: activtyJson["name"]! as! String)
            activity.address = activtyJson["address"]! as! String
            activity.logo = activtyJson["logo_img"] as! String
            activity.image = activtyJson["img"] as! String
            activity.description_en = activtyJson["description_en"] as! String
            activity.description_es = activtyJson["description_es"] as! String
            activity.openingHours_en = activtyJson["opening_hours_en"] as! String
            activity.openingHours_es = activtyJson["opening_hours_es"] as! String
            //activity.latitude = activtyJson["gps_lat"] as! Float
            //activity.longitude = activtyJson["gps_lon"] as! Float
            activity.type = "activity"
            
            activities.add(shoptivity: activity)
        }
    } catch {
        
    }
    return activities
}



