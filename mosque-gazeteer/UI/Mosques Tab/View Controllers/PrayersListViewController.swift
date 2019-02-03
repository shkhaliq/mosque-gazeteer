//
//  PrayersListViewController.swift
//  mosque-gazeteer
//
//  Created by Haris Khaliq on 2019-02-03.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import UIKit

class PrayersListViewController: UITableViewController {

    private let items: [SalahViewModel]

    init(items: [SalahViewModel]) {
        self.items = items
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(PrayerTimeCell.self)
        tableView.reloadData()

        title = NSLocalizedString("Prayers", comment: "")
    }

    // MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 52
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(PrayerTimeCell.self, for: indexPath)
        // Will write a custom cell
        cell.bindViewModel(item)
        return cell
    }
}
