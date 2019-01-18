//
// Created by H5266 on 2019-01-18.
// Copyright (c) 2019 Kakeru. All rights reserved.
//

import Foundation
import CoreBluetooth

internal class PeripheralManager: NSObject, CBPeripheralManagerDelegate {
    private var manager: CBPeripheralManager!

    internal func initialize() {
        manager = CBPeripheralManager(delegate: self, queue: nil, options: nil)
    }

    internal func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        debugPrint(peripheral.state.description)
        switch peripheral.state {
        case .poweredOn:
            let advertise: Dictionary = [CBAdvertisementDataLocalNameKey: "iPhoneX"]
            manager.startAdvertising(advertise)
        case .unknown, .resetting, .unsupported, .unauthorized, .poweredOff:
            break
        }
    }

    func peripheralManagerDidStartAdvertising(_ peripheral: CBPeripheralManager, error: Error?) {
        debugPrint("アドバタイズ")
        debugPrint(peripheral.state.description)
    }
}