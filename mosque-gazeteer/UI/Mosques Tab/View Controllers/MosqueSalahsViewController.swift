//
//  MosqueSalahsViewController.swift
//  mosque-gazeteer
//
//  Created by Haris Khaliq on 2019-02-08.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import Foundation
import IGListKit

class MosqueSalahsViewController: UIViewController, ListAdapterDataSource {

    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

    private lazy var adapter: ListAdapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self)

    private var items: [SalahViewModel] = []
    private let id: Int
    private let dataClient: MosqueDataClientType

    init(mosque: MosqueViewModel, dataClient: MosqueDataClientType = MosqueDataClient.shared) {
        self.id = mosque.id
        self.dataClient = dataClient
        super.init(nibName: nil, bundle: nil)
        self.title = mosque.name
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(collectionView)
        collectionView.frame = view.bounds
        collectionView.backgroundColor = UIColor.white
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        adapter.collectionView = collectionView
        adapter.dataSource = self

        load()
    }

    public func load() {
        dataClient.fetchAllSalahs(for: id) { (salahs, _) in
            guard let salahs = salahs else {
                return
            }
            self.items = salahs.map(SalahViewModel.init)
            DispatchQueue.main.async {
                self.adapter.performUpdates(animated: true, completion: nil)
            }
        }
    }

    // MARK: - ListAdapterDataSource
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return items
    }

    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        let sectionController = MosqueSalahsSectionController()
        return sectionController
    }

    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
