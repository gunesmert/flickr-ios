//
//  NetworkManager.swift
//  flickr
//
//  Created by Mert Ahmet Güneş on 2018-05-06.
//  Copyright © 2018 tretton37. All rights reserved.
//

import Alamofire

private let baseURL 	= "https://api.flickr.com/services/rest/"
private let apiKey		= "767507130d7c1bed47f868a7d1d8272d"

final class NetworkManager {
	static let shared = NetworkManager()
	
	func fetchElements(withDraft draft: FeedElementDraft,
					   _ completion: @escaping (String?) -> Void) {
		var parameters = draft.toDictionary()
		parameters["api_key"] = apiKey
		
		var headers = [String: String]()
		headers["Content-Type"] = "application/json"
		
		Alamofire.request(baseURL,
						  method: .get,
						  parameters: parameters,
						  encoding: URLEncoding.default,
						  headers: headers).response { (dataResponse) in
			if let data = dataResponse.data?.trimmed() {
				if let jsonString = String(data: data, encoding: String.Encoding.utf8) {
					completion(jsonString)
				}
			}
		}
	}
}



