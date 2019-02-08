//
//  PrayerTimeCell.swift
//  mosque-gazeteer
//
//  Created by Haris Khaliq on 2019-02-03.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import UIKit

class PrayerTimeCell: UICollectionViewCell {

    private let prayerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()

    private let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
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
        contentView.addSubview(prayerLabel)
        contentView.addSubview(timeLabel)

        NSLayoutConstraint.activate([
            prayerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            prayerLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            timeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            timeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ])
    }

    func bindViewModel(_ viewModel: SalahViewModel) {
        prayerLabel.text = viewModel.name
        timeLabel.text = DateFormatter.localTimeFormat.string(from: viewModel.time)
    }
}
