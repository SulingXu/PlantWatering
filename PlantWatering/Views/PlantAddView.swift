//
//  PlantAddView.swift
//  PlantWatering
//
//  Created by Suling Xu on 12/30/20.
//

import SwiftUI

struct PlantAddView: View {
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage?
    @State private var isImagePickerDisplay = false
    @EnvironmentObject var modelData: ModelData
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var plantName: String = ""
    @State private var isScheduleEditing = false
    @State var description: String = ""
    @State private var schedule: Double = 0
    
    @State private var alertItem: AlertItem?
    @ObservedObject private var kGuardian = KeyboardGuardian(textFieldCount: 1)
    
    var isIdenticalName: Bool {
        for plant in modelData.plants {
            if (plant.name == self.plantName) {
                return true
            }
        }
        return false
    }

    
    var body: some View {
        NavigationView {
            VStack {
                if selectedImage != nil {
                    Image(uiImage: selectedImage!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                    
                } else {
                    Image(systemName: "snow")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .frame(width: 200, height: 200)
                }
                
                HStack {
                    Button(action: {
                        self.sourceType = .camera
                        self.isImagePickerDisplay.toggle()
                    }) {
                        Image(systemName: "camera")
                    }
                    .padding()
                    .buttonStyle(BorderlessButtonStyle())
                    
                    Button(action: {
                        self.sourceType = .photoLibrary
                        self.isImagePickerDisplay.toggle()
                    }) {
                        Image("photoLibrary")
                    }
                    .padding()
                    .buttonStyle(BorderlessButtonStyle())
                }
                
                VStack(alignment: .leading){
                    Text("Plant's name:")
                        .font(.callout)
                        .bold()
                    TextField("Enter plant name...", text: $plantName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Spacer()
                        .frame(height: 18)
                    
                    Text("Schedule:")
                        .font(.callout)
                        .bold()
                    Slider(
                        value: $schedule,
                        in: 1...30,
                        step: 1,
                        onEditingChanged: { editing in
                            isScheduleEditing = editing
                        },
                        minimumValueLabel: Text("0"),
                        maximumValueLabel: Text("30")
                    ) {
                        Text("Schedule")
                    }.accentColor(.green)
                    
                    if (Int(schedule) <= 1) {
                        Text("watering schedule is \(Int(schedule)) day")
                            .foregroundColor(isScheduleEditing ? .red : .blue)
                            .frame(maxWidth: .infinity, alignment: .center)
                    } else {
                        Text("watering schedule is \(Int(schedule)) days")
                            .foregroundColor(isScheduleEditing ? .red : .blue)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
            
                    Spacer()
                        .frame(height: 20)
                    
                    Text("Description:")
                        .font(.callout)
                        .bold()
                    TextField("Enter plant name...",text: $description)
                        .disableAutocorrection(true)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .background(GeometryGetter(rect: $kGuardian.rects[0]))
    
                }
                .offset(y: kGuardian.slide).animation(.easeInOut(duration: 1.0))
                .padding()
            }
            .navigationBarTitle("Add a new plant")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: self.$isImagePickerDisplay) {
                ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
            }
            .alert(item: $alertItem) { alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
            }
            .navigationBarItems(trailing: Button(action: {
                if selectedImage == nil {
                    self.alertItem = AlertItem(title: Text("Wrong Image Input!"),
                                               message: Text("Please take a photo or select an image for your plant!"),
                                               dismissButton: .default(Text("Got it!")))
                } else if self.plantName == "" {
                    self.alertItem = AlertItem(title: Text("Wrong Name Input!"),
                                               message: Text("The Plant name cannot be empty! Please input your plant's name."),
                                               dismissButton: .default(Text("Got it!")))
                }else if isIdenticalName {
                    self.alertItem = AlertItem(title: Text("Wrong Name Input!"),
                                               message: Text("This name has existed! Please input another plant's name."),
                                               dismissButton: .default(Text("Got it!")))
                } else if Int(self.schedule) == 0 {
                    self.alertItem = AlertItem(title: Text("Wrong Schedule Input!"),
                                               message: Text("The Schedule cannot be 0 day! Please select your plant's watering schedule."),
                                               dismissButton: .default(Text("Got it!")))
                } else {
                modelData.plants.append(Plant(name: self.plantName, lastWateringTime: Date(), schedule: Int(self.schedule), hasWatered: true, image: Image(uiImage: selectedImage!), description: self.description))
                    self.presentationMode.wrappedValue.dismiss()
                }
            }) {
                Text("Save")
            })
        }
    }
}

struct PlantAddView_Previews: PreviewProvider {
    static var previews: some View {
        PlantAddView()
    }
}
