//
//  Home.swift
//  Bluetooth
//
//  Created by Sebastian on 1/30/20.
//  Copyright © 2020 Sebastian. All rights reserved.
//

import SwiftUI

struct Home: View {
    
    @State private var searchTxt: String = ""
    
    var body: some View {
        NavigationView {
            
            ZStack {
                BackgroundColor()
                HomeMainContent(searchTxt: $searchTxt)
            }
                
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
        } // end NavigationView
            .navigationViewStyle(StackNavigationViewStyle())
    }// end some View
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
            .previewDisplayName("iPhone 11")
    }
}






/**
 =====================================================================
 */





struct BackgroundColor: View {
    var body: some View {
        Color.RGB(red: 233, green: 235, blue: 239)
            .edgesIgnoringSafeArea(.all)
    }
}


struct HomeMainContent: View {
    
    @Binding var searchTxt: String
    
    var body: some View {
        VStack {
            ScrollView (.vertical, showsIndicators: false) {
                Header()
                SearchBar(searchTxt: $searchTxt)
                CardsListView()
            } // end scrollview
                .frame(maxWidth: .infinity)
        } //end VStack Parent
    }
}


struct Header: View {
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Text("Mobile Development")
                    .font(.title)
                    .bold()
                
                Spacer()
                
                Image("network")
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 46, height: 46)
                    .clipShape(Circle())
                    .padding(.trailing, isDeviceiPad ? -16 : 0)
            }
            .padding(.horizontal)
            .padding(.leading, isDeviceiPad ? -16 : 16)
            .padding(.top, 20)
            .padding(.bottom, 20)
            .background(Color.RGB(red: 233, green: 235, blue: 239))
            .frame(maxWidth: isDeviceiPad ? 420 : .infinity )
            .edgesIgnoringSafeArea(.top)
        } // end header
    }
}


struct SearchBar: View {
    
    @Binding var searchTxt: String
    
    var body: some View {
        VStack {
            TextField("Search", text: $searchTxt)
                .padding() // Text inside padding
                .frame(width: isDeviceiPad ? 420 : 350, height: 46)
                .background(Color.RGB(red: 233, green: 235, blue: 239))
                .cornerRadius(12)
                .padding(.bottom)
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 8, y: 8)
                .shadow(color: Color.white.opacity(1), radius: 6, x: -8, y: -8)
        } // end search
    }
}


struct CardsListView: View {
    
    private let items: [Card] = cards
    
    var body: some View {
        VStack (spacing: 20) {
            ForEach( self.items ) {
                CardView(id: $0.id, image: $0.image, title: $0.title, location: $0.location, description: $0.description, action: $0.action)
            }
        } // end cards
            .frame(maxWidth: .infinity)
    }
}
