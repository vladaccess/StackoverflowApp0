//
//  ImageChache.swift
//  StackoverflowApp
//
//  Created by Краснокутский Владислав on 01.06.2022.
//

import UIKit

final class ImageChache {
	
	private let cacheQueue = DispatchQueue(label: "cache.queue", qos: .userInitiated, attributes: .concurrent)
	
	static let publicCache = ImageChache()
	
	private let cachedImages = NSCache<NSURL, UIImage>()
	
	private init() {}
	
	func loadImage(_ url: URL, completion: @escaping (UIImage?) -> Void) {
		if let cachedImage = image(from: url) {
			completion(cachedImage)
			return
		}
		
		URLSession.shared.dataTask(with: url) { data, response, error in
			if let data = data, let image = UIImage(data: data) {
				
				self.setImage(image, with: url)
				
				DispatchQueue.main.async {
					completion(image)
				}
			} else {
				DispatchQueue.main.async {
					completion(nil)
				}
			}
		}.resume()
	}
}

private extension ImageChache {
	func image(from url: URL) -> UIImage? {
		cacheQueue.sync {
			return cachedImages.object(forKey: url as NSURL)
		}
	}
	
	func setImage(_ image: UIImage, with url: URL) {
		cacheQueue.async(flags: .barrier) {
			self.cachedImages.setObject(image, forKey: url as NSURL)
		}
	}
}
