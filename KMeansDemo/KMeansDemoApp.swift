//
//  KMeansDemoApp.swift
//  KMeansDemo
//
//  Created by Vadim Dagman on 1/5/24.
//

import SwiftUI

@main
struct KMeansDemoApp: App {
    @State private var imageProcessor = ImageProcessor()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(ImageProcessor())
        }
    }
}
