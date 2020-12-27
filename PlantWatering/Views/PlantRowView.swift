//
//  PlantRowView.swift
//  PlantWatering
//
//  Created by Suling Xu on 12/26/20.
//

import SwiftUI

struct PlantRowView: View {
    var plant: Plant
    
    var body: some View {
        HStack(alignment: .center, spacing: 15, content: {
            RoundedRect(image: plant.image)
            VStack(alignment: .leading, spacing: 15, content: {
                HStack {
                    Text(plant.name)
                        .font(.title)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                HStack(spacing: 5, content: {
                    Text("Next watering:")
                        .font(.callout)
                    Text("\(plant.nextWateringTime)")
                        .font(.footnote)
                })
            })
        })
    }
}

struct PlantRowView_Previews: PreviewProvider {
    static var previews: some View {
        let plant = Plant(name: "Plant 1", lastWateringTime: Date(), schedule: 10, nextWateringTime: "1 day later", hasWatered: false, image: Image("Spathiphyllum"))
        PlantRowView(plant: plant)
            
    }
}
