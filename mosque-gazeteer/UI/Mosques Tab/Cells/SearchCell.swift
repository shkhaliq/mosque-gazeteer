//
//  SearchCell.swift
//  mosque-gazeteer
//
//  Created by Haris Khaliq on 2019-02-08.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import UIKit

final class SearchCell: UICollectionViewCell {

    lazy var searchBar: UISearchBar = {
        let view = UISearchBar()
        view.placeholder = "Search Mosques"
        self.contentView.addSubview(view)
        return view
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        searchBar.frame = contentView.bounds
    }
}
