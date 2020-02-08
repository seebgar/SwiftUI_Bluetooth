//
//  DetailView.swift
//  Bluetooth
//
//  Created by Sebastian on 1/30/20.
//  Copyright © 2020 Sebastian. All rights reserved.
//

import SwiftUI

struct ImagePickerDetail: View {
    
    @Binding var image: UIImage
    public var title: String
    public var location: String
    public var description: String
    public var action: String
    
    @State private var showPicker: Bool = false
    @State private var showCamera: Bool = false
    @State private var showFilter: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                VStack (alignment: .center, spacing: 8) {
                    Image(uiImage: image)
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
                
                VStack {
                    if self.showFilter {
                        ImageFilterView(imageSelected: self.$image)
                            .frame(height: 360)
                    }
                }
                
                VStack (alignment: .center) {
                    Button(action: {
                        self.showPicker.toggle();
                        self.showCamera = false
                    } ) {
                        Text("\(action)")
                            .frame(width: 300, height: 40)
                            .background(Color.RGB(red: 0, green: 87, blue: 217))
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                    
                    Button(action: {
                        self.showPicker.toggle();
                        self.showCamera = true
                    } ) {
                        Text("Open Camera")
                            .frame(width: 300, height: 40)
                            .background(Color.RGB(red: 0, green: 87, blue: 217))
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                    .padding(.top, 16)
                }
                .padding(.top)
                
                Spacer()
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .sheet(isPresented: $showPicker) {
            ImagePickerView(isPresenting: self.$showPicker, image: self.$image, showCamera: self.$showCamera, showFilter: self.$showFilter)
        }
    }
}

struct ImagePickerDetail_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerDetail(image: .constant(UIImage(named: "network") ?? UIImage()), title: "Product Designer", location: "Facebook Inc. Menlo Park, CA", description: "We are looking for an outstanding web designer who is passionate about UI/UX.", action: "Pick" )
            .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
            .previewDisplayName("iPhone 11")
    }
}

