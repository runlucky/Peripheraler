//
//  ViewController.swift
//  Peripheraler
//
//  Created by H5266 on 2019/01/17.
//  Copyright © 2019 Kakeru. All rights reserved.
//

import UIKit

internal class ViewController: UIViewController {
    private var peripheralManager: PeripheralManager!

    internal override func viewDidLoad() {
        super.viewDidLoad()

        peripheralManager = PeripheralManager()
        peripheralManager.initialize()
    }
}

foo
