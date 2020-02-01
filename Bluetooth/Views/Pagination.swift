//
//  Pagination.swift
//  Bluetooth
//
//  Created by Sebastian on 1/31/20.
//  Copyright © 2020 Sebastian. All rights reserved.
//

import SwiftUI

struct Pagination: View {
        
    public var id: String
    
    var body: some View {
        HStack {
            if id == "1" {
                SizeTest()
            } else if id == "2" {
                BluetoothView()
            } else if id == "3" {
                DevicesListView()
            } else {
                NotFoundView()
            }
        }
    }
}

struct Pagination_Previews: PreviewProvider {
    static var previews: some View {
        Pagination(id: "1").environmentObject(BluetoothManager())
    }
}


struct NotFoundView: View {
    var body: some View {
        VStack {
            Text("404").font(.largeTitle).bold()
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}
