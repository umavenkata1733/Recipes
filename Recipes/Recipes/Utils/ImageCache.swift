//
//  ImageCache.swift
//  Recipes
//
//  Created by Anand on 10/7/24.
//

import Foundation
import SwiftUI

class ImageCache {
    static let shared = ImageCache()
    private let cache = NSCache<NSURL, UIImage>()
    
    private init() {}
    
    func set(_ image: UIImage, for url: URL) {
        cache.setObject(image, forKey: url as NSURL)
    }
    
    func get(for url: URL) -> UIImage? {
        return cache.object(forKey: url as NSURL)
    }
}

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private var url: String?
    
    func loadImage(from imageUrl: String) {
        if let url = URL(string: imageUrl) {
            if let cachedImage = ImageCache.shared.get(for: url) {
                self.image = cachedImage
                return
            }
            Task {
                do {
                    let (data, _) = try await URLSession.shared.data(from: url)
                    if let uiImage = UIImage(data: data) {
                        ImageCache.shared.set(uiImage, for: url)
                            DispatchQueue.main.async {
                                self.image = uiImage
                            }
                    }
                } catch {
                    print("Failed to load image: \(error)")
                }
            }
        }
    }
}
