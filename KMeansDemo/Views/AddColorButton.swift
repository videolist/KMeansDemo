//
//  AddColorButton.swift
//  KMeansDemo
//
//  Created by Vadim on 1/23/24.
//

import SwiftUI

struct AddColorButton: View {
    let closure: (ColorSeedViewModel) -> Void
    var body: some View {
        Button {
            closure(.init())
        } label: {
            Rectangle()
                .stroke(Color.gray, lineWidth: 2)
                .frame(width: 50, height: 50)
                .overlay {
                    Image(systemName: "plus")
                        .font(.system(.largeTitle))
                        .foregroundStyle(.gray)
                }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    AddColorButton(closure: { _ in })
        .padding()
}
