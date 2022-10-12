//
//  QuickLookViewRepresentable.swift
//  ARLab
//
//  Created by Eric Ziegler on 10/12/22.
//

import UIKit
import SwiftUI
import QuickLook

// ****************************
// ******** DEMO NOTES ********
// ****************************
//
// QLPreviewController is UIKit, so we need to create a UIViewControllerRepresentatble version of it. That
// way, if can be presented from a SwiftUI view.
//

// ***** NOTE: As of iOS 15.0.1, there is a bug in QLPreviewController which prevents users from viewing 3D models in AR. *****
struct QuickLookViewRepresentable: UIViewControllerRepresentable {
    let url: URL
    
    func makeUIViewController(context: Context) -> QLPreviewController {
        let controller = QLPreviewController()
        controller.dataSource = context.coordinator
        return controller
    }
    
    func makeCoordinator() -> QuickLookCoordinator {
        return QuickLookCoordinator(parent: self)
    }
    
    func updateUIViewController(_ uiViewController: QLPreviewController, context: Context) { }
}
