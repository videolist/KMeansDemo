//
//  ProcessingView.swift
//  KMeansDemo
//
//  Created by Vadim on 1/16/24.
//

import SwiftUI

struct ProcessingView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.5).ignoresSafeArea()
            ProgressView {
                Text("Working...")
            }
        }
    }
}

#Preview {
    ProcessingView()
}
