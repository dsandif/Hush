//
//  Extensions.swift
//  Hush
//
//  Created by Darien Sandifer on 10/29/22.
//

import Foundation
import Foundation
import SimplyCoreAudio

extension AudioDeviceObject {
    var systemImageName: String { isInputOnlyDevice ? "mic.fill" : "speaker.wave.2.fill" }

    var prettyChannelsDescription: String {
        let inChannelDescription = "\(inputChannelCount) in\(inputChannelCount != 1 ? "s" : "")"
        let outChannelDescription = "\(outputChannelCount) out\(outputChannelCount != 1 ? "s" : "")"

        return "\(inChannelDescription) / \(outChannelDescription)"
    }
}

extension Float64 {
    var kiloHertzs: String { String(format: "%.1f kHz", self / 1000) }
}
