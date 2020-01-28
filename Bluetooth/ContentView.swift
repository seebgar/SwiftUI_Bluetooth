//
//  ContentView.swift
//  Bluetooth
//
//  Created by Sebastian on 1/28/20.
//  Copyright © 2020 Sebastian. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var manager: BluetoothManager
    
    private func activate() {
        self.manager.startManager()
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach( self.manager.devices.sorted(by: <) ) {
                    Text("\($0.name) - \($0.identifier) - \($0.status)")
                }
                .onDelete(perform: {
                    index in
                    self.manager.devices.remove(at: index.first!)
                    self.manager.startManager()
                })
            }
            .id(UUID())
            .navigationBarTitle("Bluetooth Devices")
            .alert(isPresented: self.$manager.showAlert) {
                Alert(title: Text("Bluetooth is turned off"))
            }
        }
        .onAppear(perform: activate)
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

