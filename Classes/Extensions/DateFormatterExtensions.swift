//
//  DateFormatterExtensions.swift
//  flickr
//
//  Created by Mert Ahmet Güneş on 2018-05-06.
//  Copyright © 2018 tretton37. All rights reserved.
//

import Foundation

extension DateFormatter {
	public static func defaultDateFormatter() -> DateFormatter {
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
		return formatter
	}
	
	public static func defaultTimeDisplayFormatter() -> DateFormatter {
		let formatter = DateFormatter()
		formatter.dateFormat = "MMM d, yyyy"
		return formatter
	}
}
