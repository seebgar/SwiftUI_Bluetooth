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
    
    
    var body: some View {
        VStack {
            HStack {
                Image(image)
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 46, height: 46)
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    .padding(.trailing)
                    .padding(.leading, 16)
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
            Text(description)
                .font(.system(size: 16))
                .frame(width: 300, height: 50, alignment: .topLeading)
                .foregroundColor(Color.RGB(red: 139, green: 142, blue: 145))
                .padding(.top)
            
            Button("More", action: {
                self.showSheet.toggle()
            })
                .frame(width: 300, height: 24, alignment: .leading)
        }
        .padding(.vertical)
        .background(Color.RGB(red: 233, green: 235, blue: 239))
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 12, y: 12)
        .shadow(color: Color.white.opacity(1), radius: 10, x: -12, y: -12)
        .frame(width: 350, height: 200)
            
        .sheet(isPresented: $showSheet) {
            DetailView(image: self.image, title: self.title, location: self.location, description: self.description, action: self.action) {
                Text("Working")
            }
            .padding(.top, 46)
        }
        
    }
    
}


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.RGB(red: 233, green: 235, blue: 239)
            
            CardView(id: "1", image: "network", title: "Product Designer", location: "Facebook Inc. Menlo Park, CA", description: "We are looking for an outstanding web designer who is passionate about UI/UX.", action: "Prueba")
        }
        .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        .previewDisplayName("iPhone 11")
    }
}
