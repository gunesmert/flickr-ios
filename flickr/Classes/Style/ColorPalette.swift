//
//  ColorPalette.swift
//  flickr
//
//  Created by Mert Ahmet Güneş on 2018-05-06.
//  Copyright © 2018 tretton37. All rights reserved.
//

import UIKit

public struct ColorPalette {
	public static var primaryBranding = UIColor.leetGreen
	public static var primaryBackground = UIColor.coderWhite
}

// MARK: - Private Colors
private extension UIColor {
	static var leetGreen: UIColor {
		return UIColor(hexString: "#8DC63F")
	}
	
	static var coderWhite: UIColor {
		return UIColor(hexString: "#F5F6F6")
	}
}
