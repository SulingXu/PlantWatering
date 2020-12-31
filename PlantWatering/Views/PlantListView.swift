//
//  PlantListView.swift
//  PlantWatering
//
//  Created by Suling Xu on 12/26/20.
//

import SwiftUI

struct PlantListView: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            List(modelData.plants) { plant in
                 NavigationLink(destination: PlantDetailView(plant: plant)) {
                    PlantRowView(plant: plant)
                }
            }
            .navigationTitle("My Plants")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PlantListView()
            .environmentObject(ModelData())
    }
}
