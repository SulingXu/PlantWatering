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
        HStack(alignment: .center, spacing: 20, content: {
            RoundedRect(image: plant.image, width: 120, height: 120)
                .scaledToFit()
            
            VStack(alignment: .leading, content: {
                Text(plant.name)
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                    .frame(height: 15)
                
                Text("Next watering:")
                    .font(.callout)
                
                Spacer()
                    .frame(height: 5)
                
                Text("\(plant.diffInDays)").font(.footnote)
            })
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
