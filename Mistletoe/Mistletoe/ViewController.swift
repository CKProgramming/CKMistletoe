//
//  ViewController.swift
//  Mistletoe
//
//  Created by Ryan Clark on 10/15/16.
//  Copyright © 2016 Ryan Clark. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{

    @IBOutlet weak var daysView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DaysID", for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 25
    }
    
    @IBAction func swipeView() {   //(sender: UIPanGestureRecognizer) {

        let leftSwipe = UISwipeGestureRecognizer(target: self, action: Selector(("handleSwipes")))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: Selector(("handleSwipes")))
        
        leftSwipe.direction = .left
        rightSwipe.direction = .right
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
        // let translation = sender.translation(in: self.view)
        // sender.view!.center = CGPoint(x: sender.view!.center.x + translation.x, y: sender.view!.center.y + translation.y)
        // sender.setTranslation(.zero, in: self.view)
    }
    
    func handleSwipes(sender:UISwipeGestureRecognizer) {
        if (sender.direction == .left) {
            sender.view!.center = CGPoint(x:sender.view!.center.x - 50.0, y:sender.view!.center.y);
            //swipeLabel.frame = CGRectMake( labelPosition.x , labelPosition.y , self.swipeLabel.frame.size.width, self.swipeLabel.frame.size.height)
            
        }
        
        if (sender.direction == .right) {
            sender.view!.center = CGPoint(x:sender.view!.center.x + 50.0, y:sender.view!.center.y);
        }
    }
}

