//
//  PlantDetailView.swift
//  PlantWatering
//
//  Created by Suling Xu on 12/26/20.
//

import SwiftUI

struct PlantDetailView: View {
    @EnvironmentObject var modelData: ModelData
    
    var plant: Plant
    var plantIndex: Int {
        for (index, plant) in modelData.plants.enumerated() {
            if (plant.id == self.plant.id) {
                return index
            }
        }
        return 0
    }
    
    static let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    static let taskTimeFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .long
        return formatter
    }()
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    RoundedRect(image: plant.image, width: UIScreen.main.bounds.width-30, height: 300)
                        .ignoresSafeArea(edges: .top)
                    
                    Text("\(plant.name)").font(.title)
                        .foregroundColor(.primary)
                    
                    Text("Schedule: \(plant.schedule) days").font(.subheadline).foregroundColor(.secondary)
                    
                    Spacer()
                        .frame(height: 10)
                    
                    HStack(alignment: .top, spacing: 15, content: {
                        VStack(alignment: .leading, spacing: 5, content: {
                            Text("Next watering:").font(.callout)
                            Text("\(plant.nextWateringTime)").font(.footnote)
                        })
                        
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 5, content: {
                            Text("Last watering:").font(.callout)
                            Text("\(modelData.plants[plantIndex].lastWateringTime, formatter: Self.taskDateFormat)").font(.footnote)
                                
                            Text("\(modelData.plants[plantIndex].lastWateringTime, formatter: Self.taskTimeFormat)").font(.footnote)
                        })
            
                    })
                    
                    Spacer()
                        .frame(height: 5)
                    
                    Divider()
                    
                    Text("About \(plant.name)")
                        .font(.title2)
                    
                    Text(plant.description)
                    
                }
                .padding()
            }
            .navigationTitle(plant.name)
            .navigationBarTitleDisplayMode(.inline)
            
            Button("浇水") {
                modelData.plants[plantIndex].lastWateringTime = Date()
            }
        }
    }
}

struct PlantDetailView_Previews: PreviewProvider {
    static var plants = ModelData().plants

    static var previews: some View {
        PlantDetailView(plant: plants[0])
    }
}
