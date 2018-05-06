//
//  FeedElementDraft.swift
//  flickr
//
//  Created by Mert Ahmet Güneş on 2018-05-06.
//  Copyright © 2018 tretton37. All rights reserved.
//

import Foundation

private let numberOfElementsPerPage: Int = 10
private let extras = ["description", "tags", "owner_name", "date_taken", "url_sq", "url_n", "url_z", "url_c", "url_l", "url_o"]

struct FeedElementDraft {
	var tags = [String]()
	var pageNumber: Int = 0
	
	func toDictionary() -> [String: Any] {
		var parameters = [String: Any]()
		parameters["page"] = pageNumber
		parameters["per_page"] = numberOfElementsPerPage
		parameters["tags"] = tags.joined(separator: ",")
		parameters["format"] = "json"
		parameters["method"] = "flickr.photos.search"
		parameters["extras"] = extras.joined(separator: ",")
		return parameters
	}
}
