//
//  StyleInfo.swift
//  ProjectLayering
//
//  Created by Mikhail Tikhomirov on 4/6/25.
//
import SwiftUI
import Foundation


enum StyleType: String {
    case posture,
         hair,
         jarsey,
         trousers,
         eyes_brows,
         nose,
         mouth,
         accessory
}

struct StyleInfo {
    let image: UIImage?
    let layer: Int16
    let styleType: StyleType
}

enum ClothingOption: String, CaseIterable, Identifiable {
    case hairStyle = "Hair Style"
    case tShirt = "T-Shirt"
    case trousers = "Trousers"
    case eyes_brows = "Eyes and Brows"
    case nose = "Nose"
    case mouth = "Mouth"
    case accessory = "Accessory"
    
    var id: String { rawValue }
}

let styleOptions: [ClothingOption: (StyleType: StyleType, imageName: String, layer: Int16)] = [
    .hairStyle: (.hair, "hair_option", 1),
    .tShirt: (.jarsey, "tshirt_option",3),
    .trousers: (.trousers, "trousers_option",2),
    .eyes_brows: (.eyes_brows, "eyes_brows_option", 1),
    .nose: (.nose, "nose_option", 1),
    .mouth: (.mouth, "mouth_option", 1),
    .accessory: (.accessory, "chain_option", 4)
]


