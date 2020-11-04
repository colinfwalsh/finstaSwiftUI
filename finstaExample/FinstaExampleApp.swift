//
//  finstaExampleApp.swift
//  finstaExample
//
//  Created by Colin Walsh on 10/29/20.
//

import SwiftUI

@main
struct FinstaExampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ContentViewState())
        }
    }
}
