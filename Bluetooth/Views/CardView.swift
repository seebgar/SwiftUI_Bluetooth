//
//  CardView.swift
//  Bluetooth
//
//  Created by Sebastian on 1/30/20.
//  Copyright © 2020 Sebastian. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
    public var id: String
    public var image: String
    public var title: String
    public var location: String
    public var description: String
    public var action: String
    
    @State private var showSheet: Bool = false
    @State private var imageView: UIImage = UIImage(named: "4") ?? UIImage()
    
    private var contentWidth: CGFloat {
        get {
            return isDeviceiPad ? 360 : 320
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                if self.id == "4" {
                    Image(uiImage: imageView)
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 46, height: 46)
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    .padding(.trailing)
                    .padding(.leading, 16)
                } else {
                    Image( image )
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 46, height: 46)
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    .padding(.trailing)
                    .padding(.leading, 16)
                }

                VStack (alignment: .leading, spacing: 8) {
                    Text(title)
                        .font(.system(size: 18))
                        .bold()
                    Text(location)
                        .font(.system(size: 16))
                        .foregroundColor(Color.RGB(red: 139, green: 142, blue: 145))
                }
                Spacer()
            }
            .padding(.top, 16)
            .padding(.leading, isDeviceiPad ? 15 : 0)
            
            Text(description)
                .font(.system(size: 16))
                .frame(width: contentWidth, height: 50, alignment: .topLeading)
                .foregroundColor(Color.RGB(red: 139, green: 142, blue: 145))
                .padding(.top)
            
            
            Button("More", action: {
                self.showSheet.toggle()
            })
                .frame(width: contentWidth, height: 24, alignment: .leading)
        }
        .padding(.vertical)
        .background(Color.RGB(red: 233, green: 235, blue: 239))
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 10, y: 10)
        .shadow(color: Color.white.opacity(1), radius: 12, x: -8, y: -10)
        .frame(width: isDeviceiPad ? 420 : 350, height: isDeviceiPad ? 240 : 200)
            
        .sheet(isPresented: $showSheet) {
            if self.id == "4" {
                ImagePickerDetail(image: self.$imageView, title: self.title, location: self.location, description: self.description, action: self.action)
            } else  {
                DetailView(image: self.image, title: self.title, location: self.location, description: self.description, action: self.action) {
                    Group {
                        Pagination(id: self.id)
                            .environmentObject(BluetoothManager())
                            .padding(.top, -4)
                    }
                }
                .padding(.top, 46)
            }
        }
        
        
        
    }
    
}


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.RGB(red: 233, green: 235, blue: 239)
            
            CardView(id: "3", image: "network", title: "Product Designer", location: "Facebook Inc. Menlo Park, CA", description: "We are looking for an outstanding web designer who is passionate about UI/UX.", action: "Prueba")
        }
        .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        .previewDisplayName("iPhone 11")
    }
}
