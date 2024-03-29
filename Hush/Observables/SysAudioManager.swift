//
//  SysAudioManager.swift
//  Hush
//
//  Created by Darien Sandifer on 10/29/22.
//

import Foundation
import SimplyCoreAudio

class SysAudioManager: ObservableObject {
    @Published var devices = [AudioDeviceObject]()

    private var deviceForDevice = [AudioDevice : AudioDeviceObject]() {
        didSet {
            devices = [AudioDeviceObject](deviceForDevice.values.sorted(by: <))
        }
    }

    private let simply = SimplyCoreAudio()
    private var observers = [NSObjectProtocol]()
    private let notificationCenter = NotificationCenter.default

    init() {
        for device in simply.allDevices {
            deviceForDevice[device] = AudioDeviceObject(device: device)
        }

        devices = [AudioDeviceObject](deviceForDevice.values.sorted(by: <))

        updateDefaultInputDevice()
        updateDefaultOutputDevice()
        updateDefaultSystemDevice()

        addSCAObservers()
    }

    deinit {
        removeSCAObservers()
    }
}

private extension SysAudioManager {
    func updateDefaultInputDevice() {
        if let defaultInputDevice = simply.defaultInputDevice {
            for device in devices {
                device.isDefaultInputDevice = device.id == defaultInputDevice.id
            }
        }
    }

    func updateDefaultOutputDevice() {
        if let defaultOutputDevice = simply.defaultOutputDevice {
            for device in devices {
                device.isDefaultOutputDevice = device.id == defaultOutputDevice.id
            }
        }
    }

    func updateDefaultSystemDevice() {
        if let defaultSystemDevice = simply.defaultSystemOutputDevice {
            for device in devices {
                device.isDefaultSystemOutputDevice = device.id == defaultSystemDevice.id
            }
        }
    }

    func addSCAObservers() {
      
        observers.append(contentsOf: [
            notificationCenter.addObserver(forName: .deviceListChanged, object: nil, queue: .main) { (notification) in
                if let addedDevices = notification.userInfo?["addedDevices"] as? [AudioDevice] {
                    for device in addedDevices {
                        self.deviceForDevice[device] = AudioDeviceObject(device: device)
                    }
                }

                if let removedDevices = notification.userInfo?["removedDevices"] as? [AudioDevice] {
                    for device in removedDevices {
                        self.deviceForDevice.removeValue(forKey: device)
                    }
                }
            },

            notificationCenter.addObserver(forName: .defaultInputDeviceChanged, object: nil, queue: .main) { (_) in
                self.updateDefaultInputDevice()
            },

            notificationCenter.addObserver(forName: .defaultOutputDeviceChanged, object: nil, queue: .main) { (_) in
                self.updateDefaultOutputDevice()
            },

            notificationCenter.addObserver(forName: .defaultSystemOutputDeviceChanged, object: nil, queue: .main) { (_) in
                self.updateDefaultSystemDevice()
            },

            notificationCenter.addObserver(forName: .deviceNominalSampleRateDidChange, object: nil, queue: .main) { (notification) in
                if let _device = notification.object as? AudioDevice, let device = self.deviceForDevice[_device] {
                    if let nominalSampleRate = _device.nominalSampleRate {
                        device.nominalSampleRate = nominalSampleRate
                    }
                }
            },

            notificationCenter.addObserver(forName: .deviceClockSourceDidChange, object: nil, queue: .main) { (notification) in
                if let _device = notification.object as? AudioDevice, let device = self.deviceForDevice[_device] {
                    if let clockSourceName = _device.clockSourceName {
                        device.clockSourceName = clockSourceName
                    }
                }
            }
        ])
    }

    func removeSCAObservers() {
        for observer in observers {
            notificationCenter.removeObserver(observer)
        }

        observers.removeAll()
    }
}
