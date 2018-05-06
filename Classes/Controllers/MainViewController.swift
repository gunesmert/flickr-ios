//
//  MainViewController.swift
//  flickr
//
//  Created by Mert Ahmet Güneş on 2018-05-06.
//  Copyright © 2018 tretton37. All rights reserved.
//

import UIKit

final class MainViewController: BaseViewController {
	// MARK: - Initialization / Deinitialization
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override init() {
		super.init()
		
		title = "Flickr tretton37"
		
		fetchInitialData()
	}
	
	// MARK: - Test
	func fetchInitialData() {
		let draft = FeedElementDraft(tags: ["tretton37"], pageNumber: 1)
		NetworkManager.shared.fetchElements(withDraft: draft) { response in
			
		}
	}
}
