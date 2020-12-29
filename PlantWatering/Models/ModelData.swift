//
//  ModelData.swift
//  PlantWatering
//
//  Created by Suling Xu on 12/26/20.
//

import Foundation
import SwiftUI
import Combine

final class ModelData: ObservableObject {
    @Published var plants: [Plant] = [
        Plant(name: "Spathiphyllum", lastWateringTime: Date(), schedule: 7, nextWateringTime: "7 days later", hasWatered: true, image: Image("Spathiphyllum"), description: "It lives best in shade and needs little sunlight to thrive, and is watered approximately once a week. The soil is best left moist but only needs watering if the soil is dry."),
        Plant(name: "Plant 2", lastWateringTime: Date(), schedule: 10, nextWateringTime: "2 days later", hasWatered: true, image: Image("Spathiphyllum"), description: "It lives best in shade and needs little sunlight to thrive, and is watered approximately once a week. The soil is best left moist but only needs watering if the soil is dry."),
        Plant(name: "Plant 3", lastWateringTime: Date(), schedule: 10, nextWateringTime: "3 days later", hasWatered: false, image: Image("Spathiphyllum"), description: "It lives best in shade and needs little sunlight to thrive, and is watered approximately once a week. The soil is best left moist but only needs watering if the soil is dry."),
        Plant(name: "Plant 4", lastWateringTime: Date(), schedule: 10, nextWateringTime: "4 days later", hasWatered: true, image: Image("Spathiphyllum"), description: "It lives best in shade and needs little sunlight to thrive, and is watered approximately once a week. The soil is best left moist but only needs watering if the soil is dry."),
        Plant(name: "Plant 5", lastWateringTime: Date(), schedule: 10, nextWateringTime: "5 days later", hasWatered: false, image: Image("Spathiphyllum"), description: "It lives best in shade and needs little sunlight to thrive, and is watered approximately once a week. The soil is best left moist but only needs watering if the soil is dry."),
        Plant(name: "Plant 6", lastWateringTime: Date(), schedule: 10, nextWateringTime: "6 days later", hasWatered: false, image: Image("Spathiphyllum"), description: "It lives best in shade and needs little sunlight to thrive, and is watered approximately once a week. The soil is best left moist but only needs watering if the soil is dry."),
        Plant(name: "Plant 7", lastWateringTime: Date(), schedule: 10, nextWateringTime: "7 days later", hasWatered: false, image: Image("Spathiphyllum"), description: "It lives best in shade and needs little sunlight to thrive, and is watered approximately once a week. The soil is best left moist but only needs watering if the soil is dry.")
    ]
}
