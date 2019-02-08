//
//  MosquesViewController.swift
//  mosque-gazeteer
//
//  Created by Haris Khaliq on 2019-02-08.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import UIKit
import IGListKit

class MosquesViewController: UIViewController, ListAdapterDataSource, MosquesListSectionControllerDelegate {

    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

    private lazy var adapter: ListAdapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self)

    private static let searchBar: NSString = "Search Bar"
    private var items: [ListDiffable] = [MosquesViewController.searchBar]
    private let dataClient: MosqueDataClientType

    init(dataClient: MosqueDataClientType = MosqueDataClient.shared) {
        self.dataClient = dataClient
        super.init(nibName: nil, bundle: nil)
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
        title = NSLocalizedString("Mosques", comment: "")

        load()
    }

    public func load() {
        dataClient.fetchAllMosques {[weak self] (mosques, _) in
            guard let self = self, let mosques = mosques else {
                return
            }
            self.items.append(contentsOf: mosques.map(MosqueViewModel.init))
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
        if let other = object as? NSString, other == MosquesViewController.searchBar {
            return SearchSectionController()
        }
        let sectionController = MosquesListSectionController()
        sectionController.delegate = self
        return sectionController
    }

    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }

    // MARK: - MosquesListSectionControllerDelegate
    func didSelectMosque(_ viewModel: MosqueViewModel) {
        let viewController = PrayersListViewController(mosque: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
