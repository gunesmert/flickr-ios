//
//  FeedPhoto.swift
//  flickr
//
//  Created by Mert Ahmet Güneş on 2018-05-06.
//  Copyright © 2018 tretton37. All rights reserved.
//

import UIKit

struct FeedPhoto: Decodable {
	let tags: String
	let title: String
	let author: String
	let dateTaken: String
	
	let mediumMediaBundle: MediaBundle?
	let largeMediaBundle: MediaBundle?
	
	enum CodingKeys: String, CodingKey {
		case tags
		case title
		case author = "ownername"
		case dateTaken = "datetaken"
		
		case mediumImageUrl = "url_l"
		case mediumImageWidth = "width_l"
		case mediumImageHeight = "height_l"
		
		case largeImageUrl = "url_o"
		case largeImageWidth = "width_o"
		case largeImageHeight = "height_o"
	}
	
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		tags = try container.decode(String.self, forKey: .tags)
		title = try container.decode(String.self, forKey: .title)
		author = try container.decode(String.self, forKey: .author)
		dateTaken = try container.decode(String.self, forKey: .dateTaken)
		
		do {
			let urlString = try container.decode(String.self, forKey: .mediumImageUrl)
			let widthValue = try container.decode(String.self, forKey: .mediumImageWidth)
			let heightValue = try container.decode(String.self, forKey: .mediumImageHeight)
			
			if let width = Int(widthValue), let height = Int(heightValue) {
				mediumMediaBundle = MediaBundle(urlString: urlString,
												size: CGSize(width: width, height: height))
			} else {
				mediumMediaBundle = nil
			}
		} catch {
			mediumMediaBundle = nil
		}
		
		do {
			let urlString = try container.decode(String.self, forKey: .largeImageUrl)
			let widthValue = try container.decode(String.self, forKey: .largeImageWidth)
			let heightValue = try container.decode(String.self, forKey: .largeImageHeight)
			
			if let width = Int(widthValue), let height = Int(heightValue) {
				largeMediaBundle = MediaBundle(urlString: urlString,
											   size: CGSize(width: width, height: height))
			} else {
				largeMediaBundle = nil
			}
		} catch {
			largeMediaBundle = nil
		}
	}
}
