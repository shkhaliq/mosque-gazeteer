//
//  MosqueLabelCell.swift
//  mosque-gazeteer
//
//  Created by Haris Khaliq on 2019-02-08.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import UIKit

class MosqueLabelCell: UICollectionViewCell {

    private let title: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonInit() {
        contentView.backgroundColor = .white
        contentView.addSubview(title)

        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ])
    }

    func bindViewModel(_ viewModel: MosqueViewModel) {
        title.text = viewModel.name
    }
}
