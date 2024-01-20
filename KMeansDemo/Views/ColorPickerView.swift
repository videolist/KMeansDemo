//
//  ColorPickerView.swift
//  KMeansDemo
//
//  Created by Vadim on 1/20/24.
//

import SwiftUI

struct ColorPickerView: View {
    @State var color: Color = .red
    var body: some View {
        ColorPicker("Picker", selection: $color)
    }
}

#Preview {
    ColorPickerView()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
}
