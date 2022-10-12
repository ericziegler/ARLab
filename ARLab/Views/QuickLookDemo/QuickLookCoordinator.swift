//
//  QuickLookCoordinator.swift
//  ARLab
//
//  Created by Eric Ziegler on 10/12/22.
//

import UIKit
import QuickLook

// ****************************
// ******** DEMO NOTES ********
// ****************************
//
// QLPreviewController needs a data source. Its UIViewControllerRepresentable QuickLookViewRepresentable will house
// a reference to this coordinator, which will handle displaying a single file
//

class QuickLookCoordinator: QLPreviewControllerDataSource {
    
    // MARK: - Properties
    
    let parent: QuickLookViewRepresentable
    
    // MARK: - Init
    
    init(parent: QuickLookViewRepresentable) {
        self.parent = parent
    }
    
    // MARK: - QLPreviewControllerDataSource
    
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        return parent.url as QLPreviewItem
    }
    
}
