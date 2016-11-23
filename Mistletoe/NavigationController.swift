//
//  NavigationController.swift
//  Mistletoe
//
//  Created by Zach Kobes on 11/22/16.
//  Copyright © 2016 Zach. All rights reserved.
//

import UIKit
import Material

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        self.navigationBar.backgroundColor = Color.mistletoeTan(1)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
