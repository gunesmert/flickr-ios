//
//  PhotoInformationView.swift
//  flickr
//
//  Created by Mert Ahmet Güneş on 2018-05-06.
//  Copyright © 2018 tretton37. All rights reserved.
//

import UIKit
import SnapKit

final class PhotoInformationView: UIView {
	private static let defaultMargin: CGFloat = 8.0
	
	private lazy var backgroundImageView: UIImageView = {
		let image = UIImage(named: "background-gradient-bottom-to-top")
		let view = UIImageView(image: image)
		view.backgroundColor = UIColor.clear
		return view
	}()
	
	lazy var authorLabel: UILabel = {
		let label = UILabel()
		label.textColor = ColorPalette.primaryText
		label.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.title2)
		return label
	}()
	
	lazy var timeLabel: UILabel = {
		let label = UILabel()
		label.textColor = ColorPalette.primaryText
		label.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.caption1)
		return label
	}()
	
	lazy var tagsLabel: UILabel = {
		let label = UILabel()
		label.textColor = ColorPalette.primaryText
		label.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.footnote)
		label.numberOfLines = 0
		return label
	}()
	
	// MARK: - Initialization / Deinitialization
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		backgroundColor = UIColor.clear
		
		addSubview(backgroundImageView)
		backgroundImageView.snp.makeConstraints { make in
			make.leading.bottom.trailing.equalToSuperview()
		}
		
		let sideInset = PhotoInformationView.defaultMargin * 2
		
		addSubview(tagsLabel)
		tagsLabel.snp.makeConstraints { make in
			make.leading.trailing.equalToSuperview().inset(sideInset)
			make.bottom.equalToSuperview().inset(PhotoInformationView.defaultMargin)
		}
		
		addSubview(timeLabel)
		timeLabel.snp.makeConstraints { make in
			make.leading.trailing.equalToSuperview().inset(sideInset)
			make.bottom.equalTo(tagsLabel.snp.top).offset(-PhotoInformationView.defaultMargin)
		}
		
		addSubview(authorLabel)
		authorLabel.snp.makeConstraints { make in
			make.leading.trailing.equalToSuperview().inset(sideInset)
			make.top.equalToSuperview().inset(PhotoInformationView.defaultMargin)
			make.bottom.equalTo(timeLabel.snp.top).offset(-PhotoInformationView.defaultMargin)
		}
	}
}
