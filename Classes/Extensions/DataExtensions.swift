//
//  DataExtensions.swift
//  flickr
//
//  Created by Mert Ahmet Güneş on 2018-05-06.
//  Copyright © 2018 tretton37. All rights reserved.
//

import Foundation

extension Data {
	/*
		This method is required since Flickr does not return a valid json response even tough
		we are asking for a json
	*/
	func trimmed() -> Data? {
		guard var dataString = String(data: self, encoding: String.Encoding.utf8) else {
			return nil
		}
		
		guard let startIndex = dataString.index(of: "{") else { return nil }
		dataString = String(dataString[startIndex..<dataString.endIndex])
		
		guard let endIndex = dataString.range(of: "}",
											  options: String.CompareOptions.backwards,
											  range: nil,
											  locale: nil) else { return nil }
		dataString = String(dataString[dataString.startIndex..<endIndex.upperBound])
		
		return dataString.data(using: String.Encoding.utf8)
	}
}
