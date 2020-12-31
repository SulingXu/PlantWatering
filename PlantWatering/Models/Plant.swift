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
    
}
