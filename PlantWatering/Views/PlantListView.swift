//
//  PlantListView.swift
//  PlantWatering
//
//  Created by Suling Xu on 12/26/20.
//

import SwiftUI

struct PlantListView: View {
    var body: some View {
        NavigationView {
            List(plants) { plant in
                 NavigationLink(destination: PlantDetailView(plant: plant)) {
                    PlantRowView(plant: plant)
                }
            }
            .navigationTitle("Plants")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PlantListView()
    }
}
