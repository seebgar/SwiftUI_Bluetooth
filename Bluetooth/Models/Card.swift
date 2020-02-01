//
//  Card.swift
//  Bluetooth
//
//  Created by Sebastian on 1/31/20.
//  Copyright © 2020 Sebastian. All rights reserved.
//

import SwiftUI

struct Card: Hashable, Codable, Identifiable, Comparable {
    
    var id: String
    var image: String
    var title: String
    var location: String
    var description: String
    var action: String
    
    
    static func < (lhs: Card, rhs: Card) -> Bool {
        return lhs.id < rhs.id
    }
    
}
