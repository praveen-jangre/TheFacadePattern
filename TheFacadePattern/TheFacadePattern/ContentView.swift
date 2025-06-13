//
//  ContentView.swift
//  TheFacadePattern
//
//  Created by Praveen Jangre on 13/06/2025.
//

import SwiftUI
import ImageDownloader

struct ContentView: View {
    @State private var input: String = ""
    @ObservedObject var imageProvider = ImageProvider()
    
    var body: some View {
        VStack {
            TextField("Enter URL", text: $input, onCommit: {
                Task {
                    if !input.isEmpty, let url = URL(string: input) {
                        await imageProvider.getImage(at: url)
                    }
                }
            }).font(.title)
            
            Divider()
            Image(uiImage: imageProvider.image ?? UIImage())
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}


class ImageProvider: ObservableObject {
    @Published var image: UIImage?
    
    func getImage(at url: URL) async {
        do {
            let imageURL = try await ImageDownloaderFacade.fetchDownloadedImageURL(from: url)
            
            // Update the image
            let imageData = try Data(contentsOf: imageURL)
            DispatchQueue.main.async {
                self.image = UIImage(data: imageData)
            }
        } catch {
            print("Download or file operation failed: \(error)")
        }
    }
}
