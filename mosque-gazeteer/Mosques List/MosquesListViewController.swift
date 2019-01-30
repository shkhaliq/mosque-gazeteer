//
//  MosquesListViewController.swift
//  mosque-gazeteer
//
//  Created by Haris Khaliq on 2019-01-30.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import UIKit

class MosquesListViewController: UITableViewController, UITableViewDataSource {

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
    }

    // MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
    }


}
