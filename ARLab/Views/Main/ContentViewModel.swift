//
//  ContentViewModel.swift
//  ARLab
//
//  Created by Eric Ziegler on 10/12/22.
//

import Foundation
import AVFoundation

// ****************************
// ******** DEMO NOTES ********
// ****************************
//
// Simple view model that does two things:
//  1. houses resources that are passed to the various demos
//  2. handles camera permissions
//

enum ModalSheet {
    case quickLook
    case realityKit
}

class ContentViewModel: ObservableObject {
 
    // MARK: - Properties
    
    @Published var cameraPermissionGranted = false
    @Published var curModal: ModalSheet = .quickLook
    @Published var showModal: Bool = false
    
    // it's fine to force unwrap this, since it's a demo, and the resource is embedded in the project
    let usdzURL = Bundle.main.url(forResource: "CompanionCube", withExtension: "usdz")!
    let usdzEntityName = "CompanionCube"
    
    // MARK: - Camera Permissions
    
    // ***** NOTE: A Privacy - Camera Usage Description property must be added to Info.plist for this to work *****
    func requestCameraPermission() {
        AVCaptureDevice.requestAccess(for: .video, completionHandler: { accessGranted in
            DispatchQueue.main.async {
                self.cameraPermissionGranted = accessGranted
            }
        })
    }
    
}
