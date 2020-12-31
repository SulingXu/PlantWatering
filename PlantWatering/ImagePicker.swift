//
//  ImagePicker.swift
//  PlantWatering
//
//  Created by Suling Xu on 12/30/20.
//

import SwiftUI
import UIKit

class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var picker: ImagePickerView
    
    init(picker: ImagePickerView) {
        self.picker = picker
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        print("User did choose an image")
        
        guard let selectedImage = info[.originalImage] as? UIImage else {
            print("No image found")
            return
            
        }
        self.picker.selectedImage = selectedImage
        self.picker.isPresented.wrappedValue.dismiss()
    }
}

struct ImagePickerView: UIViewControllerRepresentable {
    
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var isPresented
    var sourceType: UIImagePickerController.SourceType
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = self.sourceType
            imagePicker.delegate = context.coordinator // confirming the delegate
            return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
    
    // Connecting the Coordinator class with this struct
        func makeCoordinator() -> Coordinator {
            return Coordinator(picker: self)
        }
}
