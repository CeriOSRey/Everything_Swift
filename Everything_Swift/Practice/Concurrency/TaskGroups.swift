//
//  TaskGroups.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-16.
//

import SwiftUI

class TaskGroupDataManger {
    let url = URL(string: "https://picsum.photos/300")
    
    func fetchImagesWithAsyncLet() async -> [UIImage]? {
        async let image1 = fetchImage()
        async let image2 = fetchImage()
        async let image3 = fetchImage()
        async let image4 = fetchImage()
        async let image5 = fetchImage()
        async let image6 = fetchImage()
        
        return try? await [image1, image2, image3, image4, image5, image6]
    }
    
    func fetchImagesWithTaskGroup() async throws -> [UIImage] {
        return try await withThrowingTaskGroup(of: UIImage?.self) {  group in
            var images: [UIImage] = []
            images.reserveCapacity(6)    // put a limit for performance reasons
            for _ in 0...5 {
                group.addTask {
                    //MARK: - strong reference, how do we fix?
                    try? await self.fetchImage()
                }
            }
            
            for try await image in group {
                if let image = image {
                    images.append(image)
                }
            }
            
            return images
        }
    }
    
    private func fetchImage() async throws -> UIImage {
        guard let url = url else { throw URLError(.badURL) }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let image = UIImage(data: data) else { throw URLError(.badURL) }
            return image
        } catch let error {
            throw error
        }
    }
}

class TaskGroupVM: ObservableObject {
    
    @Published private(set) var images: [UIImage] = []
    let manager: TaskGroupDataManger
    
    init(manager: TaskGroupDataManger = TaskGroupDataManger()) {
        self.manager = manager
    }
        
    func getImages() async throws {
        do {
//            guard let images = await manager.fetchImagesWithAsyncLet() else { throw URLError(.badURL)}
            let images = try await manager.fetchImagesWithTaskGroup()
            self.images.append(contentsOf: images)
        } catch let error {
            throw error
        }
    }
    
}

struct TaskGroups: View {
    
    @StateObject private var vm: TaskGroupVM = TaskGroupVM()
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    
                    ForEach(vm.images, id: \.self) { image in
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                    }
                }
            }
            .navigationBarTitle("Task Group")
            .task {
                try? await vm.getImages()
            }
        }
    }
}

struct TaskGroups_Previews: PreviewProvider {
    static var previews: some View {
        TaskGroups()
    }
}
