//
//  AlertItem.swift
//  PlantWatering
//
//  Created by Suling Xu on 12/30/20.
//

import Foundation
import SwiftUI

struct AlertItem: Identifiable {
    var id = UUID()
    var title: Text
    var message: Text?
    var dismissButton: Alert.Button?
}
