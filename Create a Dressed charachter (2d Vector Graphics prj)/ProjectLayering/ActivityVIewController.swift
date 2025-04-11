//
//  ActivityVIewController.swift
//  ProjectLayering
//
//  Created by Mikhail Tikhomirov on 4/9/25.
//

import Foundation
import UIKit
import SwiftUI

struct ActivityVIewController: UIViewControllerRepresentable {
   
    
    typealias UIViewControllerType = UIActivityViewController
    
    let activityItems: [Any]
    
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let activityViewController = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        return activityViewController
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        // no need that peace
    }
}
