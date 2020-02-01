//
//  SizeTest.swift
//  Bluetooth
//
//  Created by Sebastian on 1/31/20.
//  Copyright © 2020 Sebastian. All rights reserved.
//

import SwiftUI

struct SizeTest: View {
    
    @Environment(\.horizontalSizeClass) var screenSize
    @Environment(\.verticalSizeClass) var screenSizeVerical
    private let bounds = UIScreen.main.bounds
    
    var body: some View {
        ZStack {
            //Color.yellow
            
            VStack {
                Text("Hello, World!")
                Text("Screen Horizontal Size Class")
                Text("\(screenSize.debugDescription)").font(.title)
                Text("Screen Vertical Size Class")
                Text("\(screenSizeVerical.debugDescription)").font(.title)
                Text("Width")
                Text("\(bounds.width, specifier: "%.2f")").font(.title)
                Text("Height")
                Text("\(bounds.height, specifier: "%.2f")").font(.title)
            }
            
            
        }
    }
}

struct SizeTest_Previews: PreviewProvider {
    static var previews: some View {
        ForEach( ["iPad Pro (9.7-inch)", "iPhone 8", "iPhone 11 Pro Max"], id: \.self ) {
            SizeTest()
                .previewDevice(PreviewDevice(rawValue: $0))
                .previewDisplayName($0)
            
        }
    }
}
