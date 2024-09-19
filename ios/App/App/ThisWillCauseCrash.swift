//
//  ThisWillCauseCrash.swift
//  App
//
//  Created by James Booth on 19/09/2024.
//

import SwiftUI

struct ThisWillCauseCrash: View {
    var body: some View {
        Text("Hello, World!")
    }
}

// Comment me out to prevent SwiftUICore crash
struct DummyUIViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        // Create and return an empty UIView
        return UIView()
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        // No updates needed for this dummy view
    }
}

#Preview {
    ThisWillCauseCrash()
}
