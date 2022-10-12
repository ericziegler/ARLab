//
//  RealityKitViewRepresentable.swift
//  ARLab
//
//  Created by Eric Ziegler on 10/12/22.
//

import SwiftUI
import ARKit
import RealityKit
import FocusEntity

// ****************************
// ******** DEMO NOTES ********
// ****************************
//
// ARView is UIKit, so we need to create a UIViewRepresentable version of it. That
// way, if can be presented from a SwiftUI view.
//

struct RealityKitViewRepresentable: UIViewRepresentable {
    
    let entityName: String
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView()

        // set up the ARSession to track the world and look for horizontal surfaces (to place objects on)
        let session = arView.session
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]
        session.run(config)

        // coaching overlay guides the user in calibrating surfaces to orient the camera
        let coachingOverlay = ARCoachingOverlayView()
        coachingOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        coachingOverlay.session = session
        coachingOverlay.goal = .horizontalPlane
        coachingOverlay.activatesAutomatically = true
        coachingOverlay.delegate = context.coordinator
        arView.addSubview(coachingOverlay)
        
        // connect the coordinator to the ARView
        context.coordinator.arView = arView
        
        // detect taps on the ARView
        arView.addGestureRecognizer(UITapGestureRecognizer(target: context.coordinator, action: #selector(RealityKitCoordinator.handleTap)))

        return arView
    }

    func updateUIView(_ view: ARView, context: Context) { }
    
    func makeCoordinator() -> RealityKitCoordinator {
        return RealityKitCoordinator(entityName: entityName)
    }
    
}
