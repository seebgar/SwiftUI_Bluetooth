//
//  ContentView.swift
//  Bluetooth
//
//  Created by Sebastian on 1/28/20.
//  Copyright © 2020 Sebastian. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showDevices: Bool = false
    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading, spacing: 10) {
                
                NavigationLink(destination: BluetoothView()) {
                    Text("Bluetooth Manager")
                }
                
                Button(action: {
                    self.showDevices.toggle()
                }) {
                    Text("Firebase Devices")
                }
                
            }
            .frame(maxWidth: .infinity)
            .frame(maxHeight: .infinity)
            .sheet(isPresented: $showDevices) {
                DevicesListView()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(BluetoothManager())
            .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
            .previewDisplayName("iPhone 11")
    }
}

