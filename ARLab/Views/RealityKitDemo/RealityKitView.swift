//
//  RealityKitView.swift
//  ARLab
//
//  Created by Eric Ziegler on 10/12/22.
//

import SwiftUI

// ****************************
// ******** DEMO NOTES ********
// ****************************
//
// ARView is UIKit, so we need to create a UIViewRepresentable version of it. That
// way, if can be presented from a SwiftUI view.
//

struct RealityKitView: View {
    
    let entityName: String
    let onDismiss: (() -> Void)?
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button("Done") {
                    self.onDismiss?()
                }
                .fontWeight(.bold)
                Spacer()
            }
            .padding()
            RealityKitViewRepresentable(entityName: entityName)
                .ignoresSafeArea()
        }
    }
}

struct RealityKitView_Previews: PreviewProvider {
    static var previews: some View {
        RealityKitView(entityName: "CompanionCube", onDismiss: nil)
    }
}
