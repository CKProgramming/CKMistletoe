//
//  Utilities.swift
//  Mistletoe
//
//  Created by Ryan Clark on 11/3/16.
//  Copyright © 2016 Zach. All rights reserved.
//

import Foundation

import UIKit
import MapKit

// MARK: Helper Extensions
extension UIViewController {
    func showAlert(withTitle title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
