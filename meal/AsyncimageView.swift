//
//  AsyncimageView.swift
//  meal
//
//  Created by Alonso Alas on 13/5/23.
//

import Foundation
import Combine
import SwiftUI
import UIKit

struct AsyncimageView: View {
    
    @State private var imageLoader = ImageLoader()
    @Binding var urlString: String?
    
    init(urlString: Binding<String?>){
        self._urlString = urlString
    }
    
    var image: some View{
        Group{
            if let image = imageLoader.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(16)
            } else {
                Text("No image present")
            }
        } // end of group
    }
    
    var body: some View{
        image.onChange(of: urlString, perform: { value in
            if let urlString = urlString, let url = URL(string: urlString) {
                imageLoader.url = url
                imageLoader.load()
            }
            
        })
    }
}

final class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    
    var url: URL?
    
    func load() {
        guard let url = url else { return }
        URLSession.shared.dataTaskPublisher(for: url)
            .map{ UIImage( data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .assign(to: &$image)
    }// end of function to fecth and load image
}// end of final class for img load
