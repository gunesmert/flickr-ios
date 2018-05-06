//
//  Identifiable.swift
//  flickr
//
//  Created by Mert Ahmet Güneş on 2018-05-06.
//  Copyright © 2018 tretton37. All rights reserved.
//

protocol Identifiable {
	static var identifier: String { get }
}

extension Identifiable {
	static var identifier: String {
		return String(describing: self)
	}
}
