//
//  FeedElementsResponse.swift
//  flickr
//
//  Created by Mert Ahmet Güneş on 2018-05-06.
//  Copyright © 2018 tretton37. All rights reserved.
//

import Foundation

struct FeedElementsResponse: Decodable {
	let pageNumber: Int
	let numberOfPages: Int
	let numberOfElementsPerPage: Int
	let totalNumberOfElements: Int
	let photos: [FeedPhoto]
	
	enum CodingKeys: String, CodingKey {
		case topLevel = "photos"
		
		case pageNumber = "page"
		case numberOfPages = "pages"
		case numberOfElementsPerPage = "perpage"
		case totalNumberOfElements = "total"
		case photos = "photo"
	}
	
	public init(from decoder: Decoder) throws {
		let topLevelContainer = try decoder.container(keyedBy: CodingKeys.self)
		let container = try topLevelContainer.nestedContainer(keyedBy: CodingKeys.self,
															  forKey: .topLevel)
		
		pageNumber = try container.decode(Int.self, forKey: .pageNumber)
		numberOfPages = try container.decode(Int.self, forKey: .numberOfPages)
		numberOfElementsPerPage = try container.decode(Int.self, forKey: .numberOfElementsPerPage)
		totalNumberOfElements = try Int(container.decode(String.self, forKey: .totalNumberOfElements))!
		photos = try container.decode([FeedPhoto].self, forKey: .photos)
	}
}
