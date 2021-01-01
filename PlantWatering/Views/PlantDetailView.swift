//
//  PlantDetailView.swift
//  PlantWatering
//
//  Created by Suling Xu on 12/26/20.
//

import SwiftUI

struct PlantDetailView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingAlert = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
     
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
                if (!modelData.plants.isEmpty) {
                    VStack(alignment: .leading, spacing: 10) {
                        RoundedRect(image: plant.image, width: UIScreen.main.bounds.width-30, height: 350)
                            .ignoresSafeArea(edges: .top)
                        
                        Text("\(plant.name)").font(.title)
                            .foregroundColor(.primary)
                        
                        Text("Schedule: \(plant.schedule) days").font(.subheadline).foregroundColor(.secondary)
                        
                        Spacer()
                            .frame(height: 10)
                        
                        HStack(alignment: .top, spacing: 15, content: {
                            VStack(alignment: .leading, spacing: 5, content: {
                                Text("Next watering:").font(.callout)
                                if (modelData.plants[plantIndex].nextWateringTime < Date()){
                                    Text("Today")
                                }else {
                                    Text("\(modelData.plants[plantIndex].nextWateringTime, formatter: Self.taskDateFormat)").font(.footnote)
                                        
                                    Text("\(modelData.plants[plantIndex].nextWateringTime, formatter: Self.taskTimeFormat)").font(.footnote)
                                }
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
            }
            Button(action: {
                modelData.plants[plantIndex].lastWateringTime = Date()
            }) {
                Image("watering")
                   .resizable()
                   .scaledToFit()
                   .frame(minWidth: nil,
                          idealWidth: 60,
                          maxWidth: nil,
                          minHeight: nil,
                          idealHeight: nil,
                          maxHeight: 60,
                          alignment: .center)
            }
            
            Spacer()
                .frame(height: 10)
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Delete plant"),
                      message: Text("Are you sure you want to completely delete this \(plant.name)?"),
                      primaryButton: .destructive(Text("Delete")) {
                        self.modelData.plants.remove(at: plantIndex)
                        self.presentationMode.wrappedValue.dismiss()
                      },
                      secondaryButton: .cancel())
            }
            .navigationTitle(plant.name)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button(action: {
                self.showingAlert = true
            }) {
                Image(systemName: "trash")
            })
        }
    }
}


struct PlantDetailView_Previews: PreviewProvider {
    static var plants = ModelData().plants

    static var previews: some View {
        PlantDetailView(plant: plants[0])
    }
}
