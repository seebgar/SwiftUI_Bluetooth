//
//  Store.swift
//  Bluetooth
//
//  Created by Sebastian on 1/30/20.
//  Copyright © 2020 Sebastian. All rights reserved.
//

import SwiftUI


let bounds: CGRect = UIScreen.main.bounds

var isDeviceiPad: Bool {
    get {
        return ( bounds.height > 1000 || bounds.width > 1000 )
    }
}


let cards: [Card] = [
    Card(id: "1", image: "1", title: "View Protocol", location: "Sprint 1, MS1 - Week 1", description: "A type that represents part of your app’s user interface and provides modifiers that you use to configure views.", action: "Show new View"),
    Card(id: "2", image: "2", title: "Core Bluetooth", location: "Sprint 1, MS2 - Week 2", description: "The Core Bluetooth framework provides the classes needed for your apps to communicate with Bluetooth-equipped low energy (LE) and Basic Rate / Enhanced Data Rate (BR/EDR) wireless technology.", action: "Show devices"),
    Card(id: "3", image: "3", title: "Firebase DB", location: "Sprint 1, MS2 - Week 2", description: "Firebase gives you functionality like analytics, databases, messaging and crash reporting so you can move quickly and focus on your users.", action: "Show database"),
    Card(id: "4", image: "4", title: "Image Picker Controller", location: "Sprint 1, MS3 - Week3", description: "A view controller that manages the system interfaces for taking pictures, recording movies, and choosing items from the user's media library.", action: "Pick an Image")
]
