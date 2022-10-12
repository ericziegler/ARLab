//
//  ContentView.swift
//  ARLab
//
//  Created by Eric Ziegler on 10/12/22.
//

import SwiftUI

// ****************************
// ******** DEMO NOTES ********
// ****************************
//
// This is the entry point for the demo. It gives the user options to select a demo.
//

struct ContentView: View {
    
    @StateObject private var viewModel: ContentViewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            Text("ARLab")
                .font(.largeTitle)
                .padding(.vertical, 5)
            Text("Choose a demo")
                .font(.title2)
            Spacer()
            ActionButton(actionText: "QuickLook Demo") {
                viewModel.curModal = .quickLook
                viewModel.showModal = true
            }
            .disabled(!viewModel.cameraPermissionGranted)
            ActionButton(actionText: "RealityKit Demo") {
                viewModel.curModal = .realityKit
                viewModel.showModal = true
            }
            .disabled(!viewModel.cameraPermissionGranted)
        }
        .padding(.vertical, 30)
        .onAppear(perform: {
            viewModel.requestCameraPermission()
        })
        .fullScreenCover(isPresented: $viewModel.showModal, content: {
            switch viewModel.curModal {
            case .quickLook:
                QuickLookView(fileURL: viewModel.usdzURL) {
                    viewModel.showModal = false
                }
            case .realityKit:
                RealityKitView(entityName: viewModel.usdzEntityName) {
                    viewModel.showModal = false
                }
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
