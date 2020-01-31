//
//  DetailView.swift
//  Bluetooth
//
//  Created by Sebastian on 1/30/20.
//  Copyright © 2020 Sebastian. All rights reserved.
//

import SwiftUI

struct DetailView <GenericView: View> : View {
    
    public var image: String
    public var title: String
    public var location: String
    public var description: String
    public var action: String
    
    public let DataView: () -> GenericView

    
    var body: some View {
        NavigationView {
            VStack {
                VStack (alignment: .center, spacing: 8) {
                    Image(image)
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 66, height: 66)
                        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                        .padding(.bottom)
                    
                    Text("\(title)")
                        .font(.system(size: 24))
                        .bold()
                    
                    Text("\(location)")
                        .font(.system(size: 16))
                        .foregroundColor(Color.RGB(red: 139, green: 142, blue: 145))
                }
                .padding(.bottom)
                
                VStack (alignment: .leading, spacing: 10) {
                    Text("\(description)")
                        .font(.system(size: 16))
                        .foregroundColor(Color.RGB(red: 139, green: 142, blue: 145))
                        .padding()
                        .padding(.horizontal)
                }
                
                VStack (alignment: .center) {
                    NavigationLink (destination: DataView()) {
                        Text("\(action)")
                            .frame(width: 300, height: 40)
                            .background(Color.RGB(red: 0, green: 87, blue: 217))
                            .foregroundColor(.white)
                            .cornerRadius(12)
                        
                    }
                }
                .padding(.top)
                
                Spacer()
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(image: "network", title: "Product Designer", location: "Facebook Inc. Menlo Park, CA", description: "We are looking for an outstanding web designer who is passionate about UI/UX.", action: "Look for devices" ) {
            Text("Alfo")
        }
            .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
            .previewDisplayName("iPhone 11")
    }
}
