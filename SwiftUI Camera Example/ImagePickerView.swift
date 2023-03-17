//
//  ImagePickerView.swift
//  SwiftUI Camera Example
//
//  Created by Luke Aronson on 3/17/23.
//

import Foundation
import UIKit
import SwiftUI

struct ImagePickerView: UIViewControllerRepresentable{
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var isPresented
    var sourceType: UIImagePickerController.SourceType
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = self.sourceType
        imagePicker.delegate = context.coordinator
        
        return imagePicker
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinater{
        return Coordinater(picker: self)
    }
}
class Coordinater: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    var picker: ImagePickerView
    
    init(picker: ImagePickerView) {
        self.picker = picker
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage{
            self.picker.selectedImage = selectedImage
            self.picker.isPresented.wrappedValue.dismiss()
            
        }
    }
}
