//
//  LoginViewController.swift
//  Mistletoe
//
//  Created by Zach on 10/28/16.
//  Copyright © 2016 Ryan Clark. All rights reserved.
//

import UIKit
import FacebookLogin
import FacebookCore

class LoginViewController: UIViewController/*, FBSDKLoginButtonDelegate*/{
	
    override func viewDidLoad() {
        super.viewDidLoad()
//		if (FBSDKAccessToken.current() != nil) {
//			print("User logged in...")
//		} else {
//			print("User not logged in...")
//		}
//		let fbLoginButton: FBSDKLoginButton! = FBSDKLoginButton()
//		self.view.addSubview(fbLoginButton)
//		fbLoginButton.delegate = self
//		fbLoginButton.center = self.view.center
//		fbLoginButton.readPermissions = ["public_profile", "email", "user_friends"]
    }
	
//	let loginButton: FBSDKLoginButton = {
//		let button = FBSDKLoginButton()
//		button.readPermissions = ["email"]
//		return button
//	}()
	
//	func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
//		if error != nil {
//			print(error.localizedDescription)
//			return
//		}
//		
//		if let userToken = result.token {
//			//Get user access token
//			let token : FBSDKAccessToken = result.token
//
//			print("Token = \(FBSDKAccessToken.current().tokenString!)")
//			print("User ID = \(FBSDKAccessToken.current().userID!)")
//
////			let protectedPage = self.storyboard?.instantiateCollectionView(withIdentifier: "ProtectedHomePageCollectionView") as! ProtectedHomePageCollectionView
////			let protectedPageNav = UINavigationController(rootViewController: protectedPage)
////			let appDelegate = UIApplication.shared.delegate as! AppDelegate
////			AppDelegate.window?.rootViewController = protectedPageNav
//			performSegue(withIdentifier: "loginToDays", sender: nil)
//		}
//	}
	
//	func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
//		print("User logged out...")
//	}
//	
//	func loginButtonWillLogin(_ loginButton: FBSDKLoginButton!) -> Bool {
//		print("User logged out...") //Why does this say logged out? the function is called WillLogin
//		return true
//	}
	
	@IBAction func FbkButtonPressed(_ sender: UIButton) {
		let loginManager = LoginManager()
	}
	

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
