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

    internal let serviceUUIDs = [CBUUID(string: "5A73506A-4D8D-44B6-85C5-0F039C38FA4D")]

    private var advertise: Dictionary<String, Any> {
        return [
            CBAdvertisementDataLocalNameKey: "Peripheraler",
            CBAdvertisementDataServiceUUIDsKey: serviceUUIDs
        ]
    }

    private var service: CBMutableService {
        let service = CBMutableService(type: serviceUUIDs.first!, primary: true)
        service.characteristics = [characteristic]
        return service
    }

    private var characteristic: CBMutableCharacteristic {
        let uuid = CBUUID(string: "060B59AA-B82C-42EC-9F04-D0CAEA896617")
        return CBMutableCharacteristic(type: uuid, properties: .read, value: nil, permissions: .readable)
    }

    internal func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        debugPrint(peripheral.state.description)
        switch peripheral.state {
        case .poweredOn:
            manager.startAdvertising(advertise)
            manager.add(service)
        case .unknown, .resetting, .unsupported, .unauthorized, .poweredOff:
            break
        }
    }

    internal func peripheralManagerDidStartAdvertising(_ peripheral: CBPeripheralManager, error: Error?) {
        debugPrint("アドバタイズ開始")
    }

    internal func peripheralManager(_ peripheral: CBPeripheralManager, didAdd service: CBService, error: Error?) {
        debugPrint("サービス追加")
    }
}