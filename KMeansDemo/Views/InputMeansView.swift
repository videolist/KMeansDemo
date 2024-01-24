//
//  InputMeansView.swift
//  KMeansDemo
//
//  Created by Vadim on 1/17/24.
//

import SwiftUI

struct InputMeansView: View {
    let viewModel: InputMeansViewModel
    init(imageProcessor: ImageProcessor) {
        viewModel = .init(imageProcessor: imageProcessor)
    }

    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text("Input Means")
                    .font(.headline)

                if viewModel.hasChanged {
                    Button("Apply") {
                        viewModel.apply()
                    }
                }

            }

            ColorGridView(viewModel: viewModel)
        }
        .padding()
    }
}

#Preview {
    InputMeansView(imageProcessor: .init())
        .frame(width: 800)
}
