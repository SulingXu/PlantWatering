//
//  PlantDetailView.swift
//  PlantWatering
//
//  Created by Suling Xu on 12/26/20.
//

import SwiftUI

struct PlantDetailView: View {
    var plant: Plant
    
    var body: some View {
        VStack {
            Text("Plant name").font(.largeTitle)
            Text("next watering").font(.callout)
        }
    }
}

struct PlantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlantDetailView(plant: plants[0])
    }
}
