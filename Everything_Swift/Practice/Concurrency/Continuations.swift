//
//  Continuations.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-16.
//

import SwiftUI

class ContinuationNetworkManager {
    
    
    func getData(_ url: URL) async throws -> Data {
        do {
            let (data, _ ) = try await URLSession.shared.data(from: url)
            return data
        } catch let error {
            throw error
        }
    }
    
    func getData2(_ url: URL) async throws -> Data {
        // MARK: - use continuation to pause a task while waiting for another task to finish. Resume it when you are ready to resume it.
        /// **continuation.resume() must be called exactly once. no more no less.
        return try await withCheckedThrowingContinuation { continuation in
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    continuation.resume(returning: data)
                } else if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(throwing: URLError(.badURL))
                }
            }
            .resume()
        }
    }
    
    // Using continuation on closures
    func getHeartImageFromDatabase(completion: @escaping(UIImage) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            completion(UIImage(systemName: "heart.fill")!)
        }
    }
    
    func getHeartImageFromDatabase() async -> UIImage {
        await withCheckedContinuation({ cont in
            getHeartImageFromDatabase { image in
                cont.resume(returning: image)
            }
        })
    }
}

class ContinuationVM: ObservableObject {
    @Published var image: UIImage? = nil
    let networkManager = ContinuationNetworkManager()
    
    func getImage() async {
        guard let url = URL(string: "https://picsum.photos/200") else { return }
        do {
            let data = try await networkManager.getData2(url)
            if let image = UIImage(data: data) {
                await MainActor.run(body: {
                    self.image = image
                })
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func getHeartImage() async {
//        networkManager.getHeartImageFromDatabase { [weak self] image in
//            self?.image = image
//        }
        self.image = await networkManager.getHeartImageFromDatabase()
    }
}

struct Continuations: View {
    
    @StateObject private var vm = ContinuationVM()
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
        }
        .task {
//            await vm.getImage()
            await vm.getHeartImage()
        }
    }
}

struct Continuations_Previews: PreviewProvider {
    static var previews: some View {
        Continuations()
    }
}
