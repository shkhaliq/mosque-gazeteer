//
//  MosquesListViewController.swift
//  mosque-gazeteer
//
//  Created by Haris Khaliq on 2019-01-30.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import UIKit

class MosquesListViewController: UITableViewController {

    private var items: [MosqueViewModel] = []

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.register(UITableViewCell.self)

        title = NSLocalizedString("Mosques", comment: "")
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: nil)

        load()
    }

    public func load() {
        MosqueDataClient.shared.fetchAllMosques { (mosques, _) in
            guard let mosques = mosques else {
                return
            }
            self.items = mosques.map(MosqueViewModel.init)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(UITableViewCell.self, for: indexPath)
        // Will write a custom cell
        cell.textLabel?.text = item.name
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]

        let viewController = PrayersListViewController(mosque: item)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
