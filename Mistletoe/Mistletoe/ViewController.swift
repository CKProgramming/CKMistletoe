//
//  ViewController.swift
//  Mistletoe
//
//  Created by Zach Kobes & Ryan Clark on 10/15/16.
//  Copyright © 2016 Ryan Clark. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, FBSDKLoginButtonDelegate {

    @IBOutlet weak var daysView: UICollectionView!
    @IBOutlet var btnFacebook: FBSDKLoginButton!
    
    let loginButton: FBSDKLoginButton = {
        let button = FBSDKLoginButton()
        button.readPermissions = ["email"]
        return button
    }()
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if (error != nil) {
            print(error.localizedDescription)
            return
        }
    
        if let userToken = result.token {
            //Get user access token
            let token:FBSDKAccessToken = result.token
            
            print("Token = \(FBSDKAccessToken.current().tokenString)")
            print("User ID = \(FBSDKAccessToken.current().userID)")
            
            let protectedPage = self.storyboard?.instantiateCollectionView(withIdentifier: "ProtectedHomePageCollectionView") as! ProtectedHomePageCollectionView
            
            let protectedPageNav = UINavigationController(rootViewController: protectedPage)
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
            AppDelegate.window?.rootViewController = protectedPageNav
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("User logged out...")
    }
    
    func loginButtonWillLogin(_ loginButton: FBSDKLoginButton!) -> Bool {
        print("User logged out...")
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.viewDidLoad()
        if (FBSDKAccessToken.current() != nil) {
            print("User logged in...")
        } else {
            print("User not logged in...")
        }
        let fbLoginButton: FBSDKLoginButton! = FBSDKLoginButton()
        self.view.addSubview(fbLoginButton)
        fbLoginButton.delegate = self
        fbLoginButton.center = self.view.center
        fbLoginButton.readPermissions = ["public_profile", "email", "user_friends"]
        
        daysView.delegate = self
        daysView.dataSource = self
        if let flowLayout = daysView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.minimumLineSpacing = 0
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
}

