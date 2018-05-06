//
//  MainViewController.swift
//  flickr
//
//  Created by Mert Ahmet Güneş on 2018-05-06.
//  Copyright © 2018 tretton37. All rights reserved.
//

import UIKit
import Kingfisher

final class MainViewController: BaseViewController {
	private lazy var tableView: UITableView = {
		let tableView = UITableView()
		tableView.register(PhotoCell.self, forCellReuseIdentifier: PhotoCell.identifier)
		tableView.rowHeight = UITableViewAutomaticDimension
		tableView.delegate = self
		tableView.dataSource = self
		tableView.separatorStyle = UITableViewCellSeparatorStyle.none
		return tableView
	}()
	
	private var photos = [FeedPhoto]()
	
	private var latestResponse: FeedElementsResponse? {
		didSet {
			guard let response = latestResponse else { return }
			photos.append(contentsOf: response.photos)
			tableView.reloadData()
		}
	}
	
	// MARK: - Initialization / Deinitialization
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override init() {
		super.init()
		
		title = "Flickr tretton37"
	}
	
	// MARK: - View Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.addSubview(tableView)
		tableView.snp.makeConstraints { make in
			make.edges.equalToSuperview()
		}
		
		fetchData()
	}
	
	// MARK: - Data
	func fetchData() {
		let draft = FeedElementDraft(tags: ["tretton37"], pageNumber: 1)
		NetworkManager.shared.fetchElements(withDraft: draft) { response in
			self.latestResponse = response
		}
	}
	
	// MARK: - Cell Configuration
	private func configure(_ cell: PhotoCell, forRowAt indexPath: IndexPath) {
		guard indexPath.row < photos.count else { return }
		
		var photo = photos[indexPath.row]
		cell.photoInformationView.authorLabel.text = photo.author
		cell.photoInformationView.tagsLabel.text = photo.formattedTags
		cell.photoInformationView.timeLabel.text = photo.formattedTime
		
		guard let bundle = photo.mediumMediaBundle else { return }
		
		if let url = URL(string: bundle.urlString) {
			cell.photoInformationView.isHidden = true
			cell.photoView.contentMode = UIViewContentMode.center
			cell.photoView.kf.setImage(with: url,
									   placeholder: UIImage(named: "icon-ninja-star"),
									   options: nil,
									   progressBlock: nil) { (_, error, _, _) in
				if error == nil {
					cell.photoInformationView.isHidden = false
					cell.photoView.contentMode = UIViewContentMode.scaleAspectFit
				}
			}
		} else {
			cell.photoView.image = nil
		}
		
		let screenWidth = UIScreen.main.bounds.size.width
		let height = (screenWidth * bundle.size.height) / bundle.size.width
		
		cell.photoView.snp.updateConstraints { update in
			update.height.equalTo(height).priority(999)
		}
	}
}

// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
	}
}

// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return latestResponse?.photos.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: PhotoCell.identifier,
													   for: indexPath) as? PhotoCell else {
			return UITableViewCell()
		}
		configure(cell, forRowAt: indexPath)
		return cell
	}
}
