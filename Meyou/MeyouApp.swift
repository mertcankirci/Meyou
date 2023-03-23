//
//  MeyouApp.swift
//  Meyou
//
//  Created by Mertcan Kırcı on 8.01.2023.
//

import SwiftUI

@main
struct MeyouApp: App {
    
    var network = Network()
    
    var body: some Scene {
        WindowGroup {
            ContentView(question1: questionData[0])
                .environmentObject(network)
        }
    }
}
