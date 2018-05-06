//
//  PhotoCell.swift
//  flickr
//
//  Created by Mert Ahmet Güneş on 2018-05-06.
//  Copyright © 2018 tretton37. All rights reserved.
//

import UIKit
import SnapKit

final class PhotoCell: UITableViewCell, Identifiable {
	lazy var photoView: UIImageView = {
		let view = UIImageView()
		view.backgroundColor = ColorPalette.primaryBackground
		view.contentMode = UIViewContentMode.scaleAspectFit
		return view
	}()
	
	let photoInformationView = PhotoInformationView(frame: CGRect.zero)
	
	// MARK: - Initialization / Deinitialization
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		contentView.addSubview(photoView)
		photoView.snp.makeConstraints { make in
			make.leading.top.trailing.equalToSuperview()
			make.bottom.equalToSuperview().inset(8.0)
			make.height.equalTo(0.0).priority(999)
		}
		
		photoView.addSubview(photoInformationView)
		photoInformationView.snp.makeConstraints { make in
			make.leading.bottom.trailing.equalToSuperview()
		}
	}
}
