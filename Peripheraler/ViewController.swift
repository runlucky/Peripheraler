//
//  ViewController.swift
//  Peripheraler
//
//  Created by H5266 on 2019/01/17.
//  Copyright © 2019 Kakeru. All rights reserved.
//

import UIKit
import CoreBluetooth

internal class ViewController: UIViewController {
    private var peripheralManager: CBPeripheralManager!

    internal override func viewDidLoad() {
        super.viewDidLoad()

        peripheralManager = CBPeripheralManager(delegate: PeripheralManager(), queue: nil, options: nil)

        let advertise: Dictionary = [CBAdvertisementDataLocalNameKey: "iPhoneX"]
        peripheralManager.startAdvertising(advertise)

    }


}

