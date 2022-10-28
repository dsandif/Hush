//
//  HushApp.swift
//  Hush
//
//  Created by Darien Sandifer on 10/28/22.
//

import SwiftUI
import Foundation

@main
struct MenuApp: App {
    // 1
    @State var currentNumber: String = "1"
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        // 2
        MenuBarExtra(currentNumber, systemImage: "\(currentNumber).circle") {
            // 3
            Button("One") {
                currentNumber = "1"
            }
            Button("Two") {
                currentNumber = "2"
            }
            Button("Three") {
                currentNumber = "3"
            }
        }
    }
}
