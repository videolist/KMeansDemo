//
//  InputMeansView.swift
//  KMeansDemo
//
//  Created by Vadim on 1/17/24.
//

import SwiftUI

struct InputMeansView: View {
    let viewModel = InputMeansViewModel()
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text("Input Means")
                    .font(.headline)
                Button("Apply") {
                    viewModel.applyChange()
                }
            }

            ColorGridView(viewModel: viewModel)
        }
        .padding()
    }
}

#Preview {
    InputMeansView()
        .frame(width: 800)
}
