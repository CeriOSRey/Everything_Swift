//
//  DownLoadImageAsync.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-02.
//

import SwiftUI
import Combine

class DownloadImageAsyncImageLoader {
      
    let url = URL(string: "https://picsum.photos/200")!
    
    func handleResponse(data: Data?, response: URLResponse?) -> UIImage? {
        guard let data = data,
              let image = UIImage(data: data),
              let response = response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            return nil
        }
        return image
    }
    // Using @escaping
    func downloadWithEscaping(completionHandler: @escaping (_ image: UIImage?,_ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {[weak self] data, response, error in
            let image = self?.handleResponse(data: data, response: response)
            completionHandler(image, error)
        }
        .resume()
    }
    // Using Combine
    func downloadWithCombine() -> AnyPublisher<UIImage?, Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map(handleResponse)
            .mapError( {$0} )
            .eraseToAnyPublisher()
    }
    
    // Using Async/Await
    func downloadWithAsync() async throws -> UIImage? {
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            return handleResponse(data: data, response: response)
        } catch let error {
            throw error
        }
        
    }
}

class DownloadImageAsyncVM: ObservableObject {
    
    @Published var image: UIImage? = nil
    let loader = DownloadImageAsyncImageLoader()
    var cancellables = Set<AnyCancellable>()
    
    func fetchImage() async {
//        loader.downloadWithEscaping { [weak self] image, error in
//            if let image = image {
//                DispatchQueue.main.async {
//                    self?.image = image
//                }
//            }
//        }
        /*loader.downloadWithCombine()
            .receive(on: DispatchQueue.main)
            .sink { _ in
                
            } receiveValue: { [weak self] image in
                self?.image = image
            }
            .store(in: &cancellables) */
        let image = try? await loader.downloadWithAsync()
        // Once we start using Async/Await...we should use Actors
        // MainActor is an out of the box replacement for dispatchQueue.main
        await MainActor.run {
            self.image = image
        }
    }
}

struct DownLoadImageAsync: View {
    
    @StateObject private var vm: DownloadImageAsyncVM = DownloadImageAsyncVM()
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
            }
        }
        .onAppear {
            Task {
                // to get into async mode and be able to use await, wrap the block of code in a Task {}
                await vm.fetchImage()
            }
        }
    }
}

struct DownLoadImageAsync_Previews: PreviewProvider {
    static var previews: some View {
        DownLoadImageAsync()
    }
}
