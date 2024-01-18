//
//  InputMeansView.swift
//  KMeansDemo
//
//  Created by Vadim on 1/17/24.
//

import SwiftUI

struct InputMeansView: View {
    var body: some View {
        HStack(alignment: .top) {
            Text("Input Means")
                .font(.headline)
            ColorGridView(colors: NSColor.randomColors(count: 15))
        }
        .padding()
    }
}

#Preview {
    InputMeansView()
        .frame(width: 800)
}
