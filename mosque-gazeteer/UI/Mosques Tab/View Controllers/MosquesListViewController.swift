//
//  MosquesListViewController.swift
//  mosque-gazeteer
//
//  Created by Haris Khaliq on 2019-01-30.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import UIKit

class MosquesListViewController: UITableViewController {

    private let dataSource: MosquesListDataSource

    init(dataSource: MosquesListDataSource) {
        self.dataSource = dataSource
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.register(UITableViewCell.self)
        dataSource.load {
            self.tableView.reloadData()
        }

        MosqueDataClient().loadData(from: Endpoint.fetchMosque(for: "1")) { (result) in
        }

        title = NSLocalizedString("Mosques", comment: "")
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: nil)
    }

    // MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = dataSource.items[indexPath.row]
        let cell = tableView.dequeueReusableCell(UITableViewCell.self, for: indexPath)
        // Will write a custom cell
        cell.textLabel?.text = item.name
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = dataSource.items[indexPath.row]

        let viewController = PrayersListViewController(items: item.salahs)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
