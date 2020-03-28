//
//	RandomAlpahNumericString
//	TrackIT
//
//	Created by: Nedim on 27/03/2020
//	Copyright © 2019 bicom. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func randomizeAlpaNumericString() -> String {
    
        let length = Int.random(in: 16...32)
        
        let letters = "<>[]()$#@!-abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
}
