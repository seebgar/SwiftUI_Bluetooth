//
//  ImageFilter.swift
//  Bluetooth
//
//  Created by Sebastian on 2/7/20.
//  Copyright © 2020 Sebastian. All rights reserved.
//

import SwiftUI

struct ImageFilterView: View {
    
    @State private var colorMode: ColorBlindType! = .protanopia
    @Binding public var imageSelected: UIImage
    @State private var image: UIImage = UIImage()
    @State private var showActionSheet: Bool = false
    
    func setColor() -> Void {
        self.showActionSheet = false
        self.image = CBPixelHelper.processPixelsInImage( self.imageSelected , type: self.colorMode)
    }
    
    var body: some View {
        VStack {
            Image(uiImage: self.image)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            
            
            Button(action: {
                self.showActionSheet.toggle()
            } ) {
                Text("Change Color Blind Mode")
                    .frame(width: 300, height: 40)
                    .background(Color.RGB(red: 0, green: 87, blue: 217))
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding(.top, 16)
            
            Button(action: {
                UIImageWriteToSavedPhotosAlbum(self.image, nil, nil, nil)
            } ) {
                Text("Save to Camera Roll")
                    .frame(width: 300, height: 40)
                    .background(Color.RGB(red: 0, green: 87, blue: 217))
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding(.top, 16)
                
            .sheet(isPresented: self.$showActionSheet) {
                ColorBlindModeOptionsView(showActionSheet: self.$showActionSheet, colorMode: self.$colorMode, setColor: self.setColor)
            }
        }
        .onAppear(perform: setColor)
        
    }
    
    
}



struct ImageFilterView_Previews: PreviewProvider {
    static var previews: some View {
        ImageFilterView(imageSelected: .constant(UIImage(named: "network")!))
            .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
            .previewDisplayName("iPhone 11")
    }
}




struct ColorBlindModeOptionsView: View {
    
    @Binding var showActionSheet: Bool
    @Binding var colorMode: ColorBlindType!
    var setColor: () -> Void
    var modes: [String] = ["deuteranopia", "protanopia", "tritanopia", "achromatopsia"]
    var dictModes: [String: ColorBlindType] = ["deuteranopia": .deuteranopia, "protanopia": .protanopia, "tritanopia": .tritanopia, "achromatopsia": .achromatopsia]
    
    var body: some View {
        VStack {
            ForEach( modes, id: \.self ) { type in
                Button(action: {
                    
                    self.colorMode = self.dictModes[type]
                    self.setColor()
                    self.showActionSheet = false
                    
                } ) {
                    Text(type)
                        .frame(width: 300, height: 40)
                        .background(Color.RGB(red: 0, green: 87, blue: 217))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding(.top, 16)
            }
            
        }
    }
}



