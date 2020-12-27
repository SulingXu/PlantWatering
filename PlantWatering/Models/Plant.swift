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
    
    let name: String
    let lastWateringTime: Date
    let schedule: Int
    var nextWateringTime: String
    var hasWatered: Bool
    let image: Image 
}
