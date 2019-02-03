//
//  PrayerTimeCell.swift
//  mosque-gazeteer
//
//  Created by Haris Khaliq on 2019-02-03.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import UIKit

class PrayerTimeCell: UITableViewCell {

    private let prayerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonInit() {
        contentView.addSubview(prayerLabel)

        NSLayoutConstraint.activate([
            prayerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            prayerLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ])
    }

    func bindViewModel(_ viewModel: SalahViewModel) {
        prayerLabel.text = viewModel.name
    }
}
