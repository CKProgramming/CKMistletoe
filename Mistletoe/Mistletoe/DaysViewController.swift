//
//  DaysViewController.swift
//  Mistletoe
//
//  Created by Zach Kobes & Ryan Clark on 10/15/16.
//  Copyright © 2016 Ryan Clark. All rights reserved.
//

import UIKit

class DaysViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var daysView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        daysView.delegate = self
        daysView.dataSource = self
        if let flowLayout = daysView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.minimumLineSpacing = 0
        }
    }
	
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DaysID", for: indexPath) as! DaysCollectionViewCell
        cell.dayBackground.image = UIImage(named:"RedBackground")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 25
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width, height: collectionView.bounds.size.height)
    }
	
	override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

