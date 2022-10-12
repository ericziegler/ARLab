//
//  RealityKitCoordinator.swift
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
// ARCoachingOverlayViewDelegate needs a delegate. Its UIViewRepresentable RealityKitViewRepresentable will house
// a reference to this coordinator, which will handle delegate methods.
//

class RealityKitCoordinator: NSObject, ARCoachingOverlayViewDelegate {
    
    // MARK: - Properties
    
    weak var arView: ARView?
    let entityName: String
    private var focusEntity: FocusEntity?
    private var entity: ModelEntity?
    
    init(entityName: String) {
        self.entityName = entityName
    }
    
    // MARK: - ARCoachingSessionDelegate
    
    func coachingOverlayViewDidDeactivate(_ coachingOverlayView: ARCoachingOverlayView) {
        guard let arView = self.arView else {
            return
        }
        
        // coaching overlay has finished. add the focus entity box
        if focusEntity == nil {
            focusEntity = FocusEntity(on: arView, style: .classic(color: .tintColor))
        }
    }
    
    // MARK: - Actions
    
    @objc func handleTap() {
        addEntity()
   }
    
    // MARK: - Helpers
    
    func addEntity() {
        guard let arView = self.arView, let focusEntity = self.focusEntity, self.entity == nil else {
            return
        }
        // create an anchor to attach content to
        let anchor = AnchorEntity()
        arView.scene.anchors.append(anchor)

        // load the entity passed in, scale it down, and add it where the focus entity is, attaching to the anchor
        let entity = try! ModelEntity.loadModel(named: entityName)
        entity.scale = [0.0025, 0.0025, 0.0025]
        entity.position = focusEntity.position
        anchor.addChild(entity)

        // add support for gestures
        entity.generateCollisionShapes(recursive: true)
        arView.installGestures(.all, for: entity)

        // set the entity so it isn't added multiple times
        self.entity = entity
    }
    
}
