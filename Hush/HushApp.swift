//
//  HushApp.swift
//  Hush
//
//  Created by Darien Sandifer on 10/28/22.
//

import SwiftUI
import SimplyCoreAudio
import Liquid

@main
struct MenuApp: App {
    @StateObject private var sca = SysAudioManager()
    @State var selectedDevice: AudioDeviceObject?
    @State var currentNumber: String = "HUSH"
    
    var body: some Scene {
        MenuBarExtra("HUSH") {
          ContentView()
          .environmentObject(sca)
        }
        .menuBarExtraStyle(.window)
//        .windowResizability(.contentMinSize)
    }
}
