//
//  DaysViewController.swift
//  Mistletoe
//
//  Created by Zach on 10/30/16.
//  Copyright © 2016 Zach. All rights reserved.
//

import UIKit

class DaysViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	@IBOutlet weak var daysCollection: UICollectionView!
	
	let maxDays = 25

    override func viewDidLoad() {
        super.viewDidLoad()
		daysCollection.delegate = self
		daysCollection.dataSource = self
		
		if let flowLayout = daysCollection.collectionViewLayout as? UICollectionViewFlowLayout {
			flowLayout.minimumLineSpacing = 0
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return maxDays
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = daysCollection.dequeueReusableCell(withReuseIdentifier: "day", for: indexPath) as! DaysCollectionViewCell
		cell.daysBackground.image = UIImage(named: "RedBackground")
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: collectionView.bounds.size.width, height: collectionView.bounds.size.height)
	}
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
