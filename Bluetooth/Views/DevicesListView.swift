//
//  DevicesListView.swift
//  Bluetooth
//
//  Created by Sebastian on 1/29/20.
//  Copyright © 2020 Sebastian. All rights reserved.
//

import SwiftUI
import Firebase

struct DevicesListView: View {
    
    private var ref: DatabaseReference! = Database.database().reference(withPath: "devices")
    @State private var devices: [Device] = []
    
    private func getDevices() -> Void {
        self.ref.observe(.value) { (snapshot) in
            
            for (id, dictionary) in snapshot.value as! NSDictionary {
                var device = Device(name: nil, description: "", identifier: id as? String, status: nil)
                for (key, value) in dictionary as! NSDictionary {
                    if key as! String == "name" {
                        device.name = value as! String
                    } else if key as! String == "description" {
                        device.description = value as! String
                    }
                }
                self.devices.append(device)
            }
            
        }
    }
    
    var body: some View {
        NavigationView {
            List ( self.devices.sorted(by: <) ) {
                Text("\($0.name) - \($0.identifier)")
            }
            .navigationBarTitle(Text("Devices in Database"))
        }
        .onAppear(perform: getDevices)
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
}

struct DevicesListView_Previews: PreviewProvider {
    static var previews: some View {
        DevicesListView()
    }
}
