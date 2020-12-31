//
//  ModelData.swift
//  PlantWatering
//
//  Created by Suling Xu on 12/26/20.
//

import Foundation
import SwiftUI
import Combine

final class ModelData: ObservableObject {
    @Published var plants: [Plant] = []
}
