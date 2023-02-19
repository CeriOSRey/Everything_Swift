//
//  AsyncLet.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-16.
//

import SwiftUI

struct AsyncLet: View {
    
    @State private var images: [UIImage] = []
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    let url = URL(string: "https://picsum.photos/300")!
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(images, id: \.self) { image in
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                    }
                }
            }
            .navigationTitle("Async Let")
            .onAppear {
                Task {
                    do {
                        //MARK: - Better way
                        async let image1 = fetchImage()
                        async let image2 = fetchImage()
                        async let image3 = fetchImage()
                        async let image4 = fetchImage()
                        async let image5 = fetchImage()
                        async let image6 = fetchImage()
                        
                        try await images.append(contentsOf: [image1, image2, image3, image4, image5, image6])
                        
                        // MARK: - Long way
//                        let image = try await fetchImage()
//                        self.images.append(image)
//
//                        let image2 = try await fetchImage()
//                        self.images.append(image2)
//
//                        let image3 = try await fetchImage()
//                        self.images.append(image3)
//
//                        let image4 = try await fetchImage()
//                        self.images.append(image4)
//
//                        let image5 = try await fetchImage()
//                        self.images.append(image5)
//
//                        let image6 = try await fetchImage()
//                        self.images.append(image6)
                    } catch {
                        
                    }
                }
                
//                Task {
//                    do {
//                        let image = try await fetchImage()
//                        self.images.append(image)
//                    } catch {
//
//                    }
//                }
//
//                Task {
//                    do {
//                        let image = try await fetchImage()
//                        self.images.append(image)
//                    } catch {
//
//                    }
//                }
//
//                Task {
//                    do {
//                        let image = try await fetchImage()
//                        self.images.append(image)
//                    } catch {
//
//                    }
//                }
//
//                Task {
//                    do {
//                        let image = try await fetchImage()
//                        self.images.append(image)
//                    } catch {
//
//                    }
//                }
            }
        }
    }
    
    func fetchImage() async throws -> UIImage {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let image = UIImage(data: data) {
                return image
            } else {
                throw URLError(.badURL)
            }
        } catch let error {
            throw error
        }
    }
}

struct AsyncLet_Previews: PreviewProvider {
    static var previews: some View {
        AsyncLet()
    }
}
