//
//  Plant.swift
//  PlantWatering
//
//  Created by Suling Xu on 12/26/20.
//

import Foundation
import SwiftUI

struct Plant: Identifiable {
    var id: String {
        self.name
    }
    
    var nextWateringTime: Date {
        var dateComponent = DateComponents()
        dateComponent.day = schedule
        return Calendar.current.date(byAdding: dateComponent, to: lastWateringTime)!
    }
    
    let name: String
    var lastWateringTime: Date
    let schedule: Int
    var hasWatered: Bool
    let image: Image
    let description: String
    
    var diffInDays: String {
        let calendar = Calendar.current

        // Replace the hour (time) of both dates with 00:00
        let date1 = calendar.startOfDay(for: Date())
        let date2 = calendar.startOfDay(for: nextWateringTime)

        let components = calendar.dateComponents([.day], from: date1, to: date2)
        
        if (nextWateringTime <= Date()){
            return "Today"
        }else if components.day! == 1 {
            return "1 day later"
        } else {
            return "\(components.day!) days later"
        }
    }
}
