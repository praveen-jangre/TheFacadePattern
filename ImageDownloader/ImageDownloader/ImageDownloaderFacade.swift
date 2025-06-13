//
//  ImageDownloaderFacade.swift
//  ImageDownloader
//
//  Created by Praveen Jangre on 13/06/2025.
//

import Foundation

public struct ImageDownloaderFacade {
    public static func fetchDownloadedImageURL(from url: URL) async throws -> URL {
        // Fetch the resource from the URL and store the data in a temporary file
        let (tempFileURL, _) = try await URLSession.shared.download(from: url)
        // Create a permanent file URL and move the downloaded file to a permanent location
        let documentURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let permanentFileURL = documentURL.appendingPathComponent(tempFileURL.lastPathComponent)
        try FileManager.default.moveItem(at: tempFileURL, to: permanentFileURL)
        
        return permanentFileURL
    }
}
