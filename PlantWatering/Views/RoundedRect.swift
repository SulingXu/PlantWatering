//
//  RoundedRect.swift
//  PlantWatering
//
//  Created by Suling Xu on 12/26/20.
//
import SwiftUI

struct RoundedRect: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 4))
            .shadow(radius: 7)
            .frame(width: 120, height: 120)
            
    }
}

struct RoundedRect_Previews: PreviewProvider {
    static var previews: some View {
        RoundedRect(image: Image("Spathiphyllum"))
    }
}
