//
//  BaseNavigationController.swift
//  flickr
//
//  Created by Mert Ahmet Güneş on 2018-05-06.
//  Copyright © 2018 tretton37. All rights reserved.
//

import UIKit

private struct BaseNavigationTextAttributes {
	public static var regularTextAttributes: [NSAttributedStringKey: Any] {
		var attributes = [NSAttributedStringKey: Any]()
		attributes[NSAttributedStringKey.font] = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
		attributes[NSAttributedStringKey.foregroundColor] = ColorPalette.primaryBranding
		return attributes
	}
	
	public static var largeTextAttributes: [NSAttributedStringKey: Any] {
		var attributes = [NSAttributedStringKey: Any]()
		attributes[NSAttributedStringKey.font] = UIFont.preferredFont(forTextStyle: UIFontTextStyle.largeTitle)
		attributes[NSAttributedStringKey.foregroundColor] = ColorPalette.primaryBranding
		return attributes
	}
}

class BaseNavigationController : UINavigationController {
	// MARK: - View Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()

		navigationBar.titleTextAttributes = BaseNavigationTextAttributes.regularTextAttributes
		navigationBar.largeTitleTextAttributes = BaseNavigationTextAttributes.largeTextAttributes
		navigationBar.barTintColor = ColorPalette.primaryBackground
		navigationBar.isTranslucent = false
	}
}
