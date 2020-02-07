//
//  ImagePickerController.swift
//  Bluetooth
//
//  Created by Sebastian on 2/7/20.
//  Copyright © 2020 Sebastian. All rights reserved.
//

import SwiftUI


struct  ImagePickerView: UIViewControllerRepresentable {
    
    @Binding var isPresenting: Bool
    @Binding var image: UIImage
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerView>) -> UIViewController {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func makeCoordinator() -> ImagePickerView.Coordinator {
        return Coordinator(parent: self)
    }
    
    /**
     Selection of Image
     */
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        let parent: ImagePickerView
        
        init(parent: ImagePickerView) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selected = info[.originalImage] as? UIImage {
                self.parent.image = selected
            }
            self.parent.isPresenting = false
        }
        
    }
    
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<ImagePickerView>) { }
     
}
