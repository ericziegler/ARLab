//
//  QuickLookView.swift
//  ARLab
//
//  Created by Eric Ziegler on 10/12/22.
//

import SwiftUI

// ****************************
// ******** DEMO NOTES ********
// ****************************
//
// QuickLookView houses QuickLookController, which is a UIViewControllerRepresentable of QLPreviewController.
// The reason QuickLookView wraps the view is to add a Done button for dismissal.
//

struct QuickLookView: View {
    
    let fileURL: URL
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
            QuickLookViewRepresentable(url: fileURL)
        }
    }
}

struct QuickLookView_Previews: PreviewProvider {
    static var previews: some View {
        QuickLookView(fileURL: Bundle.main.url(forResource: "CompanionCube", withExtension: "usdz")!, onDismiss: nil)
    }
}
