//
//  ViewController.swift
//  mosque-gazeteer
//
//  Created by Haris Khaliq on 2019-01-28.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import UIKit
import FirebaseDatabase
import CodableFirebase

class ViewController: UIViewController {

    var ref: DatabaseReference?

    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        ref?.child("mosques").observeSingleEvent(of: .value, with: { (snapshot) in
            guard let value = snapshot.value else { return }
            do {
                let mosques = try FirebaseDecoder().decode([Mosque].self, from: value)
                print(mosques[0].salahs[0].iqamah)
            } catch let error {
                print(error)
            }
        })
    }


}

