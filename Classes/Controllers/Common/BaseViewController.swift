//
//  BaseViewController.swift
//  flickr
//
//  Created by Mert Ahmet Güneş on 2018-05-06.
//  Copyright © 2018 tretton37. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
	// MARK: - Initialization / Deinitialization
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	init() {
		super.init(nibName: nil, bundle: nil)
	}
	
	// MARK: - View Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = ColorPalette.primaryBackground
		extendedLayoutIncludesOpaqueBars = true
		
		if #available(iOS 11, *) {
			self.navigationController?.navigationBar.prefersLargeTitles = true
			self.navigationItem.largeTitleDisplayMode = .automatic
		}
	}
}

