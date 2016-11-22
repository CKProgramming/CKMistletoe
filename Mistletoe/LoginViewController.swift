//
//  LoginViewController.swift
//  Mistletoe
//
//  Created by Zach on 10/30/16.
//  Copyright © 2016 Zach. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoginViewController: UIViewController {

    @IBOutlet weak var facebookLoginButton: UIButton!
    
	override func viewDidLoad() {
		super.viewDidLoad()
		facebookLoginButton.layer.borderColor = UIColor.mistletoeDarkGreen(1).cgColor
        facebookLoginButton.layer.borderWidth = 5
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}

	@IBAction func facebookLoginClicked(_ sender: UIButton) {
		let loginManager = FBSDKLoginManager()
		loginManager.logIn(withReadPermissions: ["public_profile", "email", "user_friends"], from: self, handler: { (result, error) -> Void in
			if error != nil {
				print("Error \(error!.localizedDescription)")
			} else {
				self.performSegue(withIdentifier: "loginToDays", sender: sender)
			}
		})
	}
	
	/* Example getting user's fb information
	@IBAction func btnFBLoginPressed(sender: AnyObject) {
		var fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
		fbLoginManager .logInWithReadPermissions(["email"], handler: { (result, error) -> Void in
			if (error == nil){
				var fbloginresult : FBSDKLoginManagerLoginResult = result
				if(fbloginresult.grantedPermissions.contains("email"))
				{
					self.getFBUserData()
					fbLoginManager.logOut()
				}
			}
		})
	}
	
	func getFBUserData(){
		if((FBSDKAccessToken.currentAccessToken()) != nil){
		FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).startWithCompletionHandler({ (connection, result, error) -> Void in
				if (error == nil){
					println(result)
				}
			})
		}
	}
	*/

}

