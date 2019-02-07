//
//  PrayersListViewController.swift
//  mosque-gazeteer
//
//  Created by Haris Khaliq on 2019-02-03.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import UIKit

class PrayersListViewController: UITableViewController {

    private var items: [SalahViewModel] = []
    private let id: Int

    init(mosque: MosqueViewModel) {
        self.id = mosque.id
        super.init(nibName: nil, bundle: nil)
        self.title = mosque.name
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(PrayerTimeCell.self)

        load()
    }

    public func load() {
        MosqueDataClient.shared.fetchAllSalahs(for: id) { (salahs, _) in
            guard let salahs = salahs else {
                return
            }
            self.items = salahs.map(SalahViewModel.init)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
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
