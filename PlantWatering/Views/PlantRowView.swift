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
            RoundedRect(image: plant.image, width: 120, height: 120)
            
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
            Spacer()
        })
    }
}

struct PlantRowView_Previews: PreviewProvider {
    static var plants = ModelData().plants
    
    static var previews: some View {
        let plant = plants[0]
        PlantRowView(plant: plant)
            
    }
}
