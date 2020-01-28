//
//  Device.swift
//  Bluetooth
//
//  Created by Sebastian on 1/28/20.
//  Copyright © 2020 Sebastian. All rights reserved.
//

import SwiftUI

struct Device: Hashable, Codable, Identifiable {
    var id: String
    var name: String
    var description: String
    var identifier: String
    var status: String
    
    init(name: String?, description: String, identifier: String?, status: String?) {
        self.id = name ?? description
        self.name = name ?? "Unknown"
        self.description = description
        self.identifier = identifier ?? "Unknown"
        self.status = status ?? "Unknown"
    }
}
