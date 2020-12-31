//
//  PlantListView.swift
//  PlantWatering
//
//  Created by Suling Xu on 12/26/20.
//

import SwiftUI

struct PlantListView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingPlantAdd = false
    var body: some View {
        NavigationView {
            List(modelData.plants) { plant in
                 NavigationLink(destination: PlantDetailView(plant: plant)) {
                    PlantRowView(plant: plant)
                }
            }
            .navigationTitle("My Plants")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarItems(trailing: Button(action: {
                self.showingPlantAdd.toggle()
            }) {
                Image("add")
            }.sheet(isPresented: $showingPlantAdd) {
                PlantAddView()
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PlantListView()
            .environmentObject(ModelData())
    }
}
