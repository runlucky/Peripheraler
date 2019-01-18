//
// Created by H5266 on 2019-01-18.
// Copyright (c) 2019 Kakeru. All rights reserved.
//

import Foundation
import CoreBluetooth

internal extension CBManagerState {
    internal var description: String {
        switch self {
            case .unknown: return "unknown"
            case .resetting: return "resetting"
            case .unsupported: return "unsupported"
            case .unauthorized: return "unauthorized"
            case .poweredOff: return "poweredOff"
            case .poweredOn: return "poweredOn"
        }
    }
}
