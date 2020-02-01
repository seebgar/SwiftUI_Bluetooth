//
//  BluetoothView.swift
//  Bluetooth
//
//  Created by Sebastian on 1/29/20.
//  Copyright © 2020 Sebastian. All rights reserved.
//

import SwiftUI

struct BluetoothView: View {
    
    @EnvironmentObject var manager: BluetoothManager
    
    private func activate() -> Void {
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
            // .id(UUID()) // ** !! 
            .alert(isPresented: self.$manager.showAlert) {
                Alert(title: Text("Bluetooth is turned off"))
            }
            
            .navigationBarTitle(Text("Bluetooth Devices"), displayMode: .inline)
        }
        .onAppear(perform: activate)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct BluetoothView_Previews: PreviewProvider {
    static var previews: some View {
        BluetoothView()
            .environmentObject(BluetoothManager())
    }
}
