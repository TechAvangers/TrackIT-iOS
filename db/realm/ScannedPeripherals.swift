//
//	ScanedPeripherals
//	TrackIT
//
//	Created by: Nedim on 27/03/2020
//	Copyright © 2019 bicom. All rights reserved.
//

import Foundation
import RealmSwift

class ScannedPeripheral: Object {

  
    @objc dynamic var uuid:String?
    @objc dynamic var name:String?
    @objc dynamic var rssi:String?
    @objc dynamic var timestamp:String?
}


