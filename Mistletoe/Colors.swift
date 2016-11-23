//
//  Colors.swift
//  Mistletoe
//
//  Created by Zach Kobes on 11/21/16.
//  Copyright © 2016 Zach. All rights reserved.
//

import UIKit

extension UIColor {

    class func mistletoeTan(_ alpha: CGFloat) -> UIColor{
        return UIColor(red: 175/255.0, green: 145/255.0, blue:100/255.0, alpha:alpha)
    }
    
    class func mistletoeRed(_ alpha: CGFloat) -> UIColor{
        return UIColor(red: 154/255.0, green: 3/255.0, blue: 30/255.0, alpha:alpha)
    }
    
    class func mistletoeDarkRed(_ alpha: CGFloat) -> UIColor{
        return UIColor(red: 110/255.0, green: 14/255.0, blue: 10/255.0, alpha:alpha)
    }
    
    class func mistletoeGreen(_ alpha: CGFloat) -> UIColor{
        return UIColor(red: 3/255.0, green: 71/255.0, blue: 50/255.0, alpha:alpha)
    }
    
    class func mistletoeDarkGreen(_ alpha: CGFloat) -> UIColor{
        return UIColor(red: 39/255.0, green: 60/255.0, blue: 44/255.0, alpha:alpha)
    }
}
