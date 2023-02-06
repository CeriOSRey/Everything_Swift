//
//  AsyncImages.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-05.
//

import SwiftUI

//Phase is a Enum
/*
 case emtpy -> no image is loaded
 case success(Image)
 case failure(error) -> image failed to load with an error
 */

struct AsyncImages: View {
    
    let url = URL(string: "https://picsum.photos/200/300")
    
    var body: some View {
//        AsyncImage(url: url) { returnedImage in
//            returnedImage
//                .resizable()
//                .frame(width: 100, height: 100)
//                .cornerRadius(20)
//        } placeholder: {
//            ProgressView()
//        }
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(20)
            case .failure(_):
                Image(systemName: "questionmark")
                    .font(.headline)
            default:
                Image(systemName: "questionmark")
                    .font(.headline)
            }
        }
            
    }
}

struct AsyncImages_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImages()
    }
}
