//
// Created by H5266 on 2019-01-18.
// Copyright (c) 2019 Kakeru. All rights reserved.
//

import Foundation
import CoreBluetooth

internal class PeripheralManager:NSObject, CBPeripheralManagerDelegate {
    internal func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        debugPrint(peripheral.state)

    }

    func peripheralManagerDidStartAdvertising(_ peripheral: CBPeripheralManager, error: Error?) {
        debugPrint("アドバタイズ")
        debugPrint(peripheral.state)
    }
}