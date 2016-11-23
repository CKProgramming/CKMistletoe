//
//  DaysViewController.swift
//  Mistletoe
//
//  Created by Zach on 10/30/16.
//  Copyright © 2016 Zach. All rights reserved.
//

import UIKit
import Spring
import Material

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
        
        prepareNavBar()
	}
    
    func prepareNavBar() {
        navigationController?.navigationBar.barTintColor = Color.mistletoeTan(1)
        let logoutButton = UIBarButtonItem(image: UIImage(named: "Exit"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(logoutTapped))
        let settingsButton = UIBarButtonItem(image: UIImage(named: "Settings"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(settingsTapped))
        navigationItem.leftBarButtonItems = [logoutButton]
        navigationItem.rightBarButtonItems = [settingsButton]
    }
    
    func settingsTapped() {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let settingsVC = mainStoryboard.instantiateViewController(withIdentifier: "Settings") as UIViewController
        self.navigationItem.backButton.title = "Days"
        self.navigationController?.pushViewController(settingsVC, animated: true)
    }
	
    func logoutTapped() {
        identityManager().token = nil
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.showLogin()
    }
    
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return maxDays
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = daysCollection.dequeueReusableCell(withReuseIdentifier: "day", for: indexPath) as! DaysCollectionViewCell
        cell.dayLabel.text = "Dec \(indexPath.row + 1)" //displays Dec. 1st through Dec. 25th
		return cell
	}
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let cell = cell as! DaysCollectionViewCell
        cell.dayLabel.animation = "squeezeDown"
        cell.dayLabel.delay = 0.15
        cell.dayLabel.duration = 1.0
        cell.dayLabel.animate()
    }
    
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: collectionView.bounds.size.width, height: collectionView.bounds.size.height)
	}
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
