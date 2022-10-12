//
//  ButtonComponents.swift
//  ARLab
//
//  Created by Eric Ziegler on 10/12/22.
//

import SwiftUI

// MARK: - Action Button

struct ActionButton: View {
    
    var actionText: String?
    var onTap: (() -> Void)?
    
    init(actionText: String?, onTap: (() -> Void)?) {
        self.actionText = actionText
        self.onTap = onTap
    }
    
    var body: some View {
        Button {
            onTap?()
        } label: {
            Text(actionText ?? "")
        }
        .font(.headline)
        .foregroundColor(.white)
        .padding()
        .frame(width: 300, alignment: .center)
        .background(RoundedRectangle(cornerRadius: 8, style:   .circular).fill(Color.accentColor))
        .padding(.bottom, 8)

    }
    
}

// MARK: - Previews

struct Button_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            ActionButton(actionText: "Action", onTap: nil)
            Spacer()
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 0))
        }
    }
}
