//
//	RealmWriteToDatabase
//	TrackIT
//
//	Created by: Nedim on 27/03/2020
//	Copyright © 2019 bicom. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class RealmWriteDatabasePeripheralDevice: UIViewController {
    
    
    func writeToRealm(generatedUUID:String){
        
        let realm = try! Realm()
        
        let peripheralDevice = UserPeripheralService()
        peripheralDevice.generatedUUID = generatedUUID
        
        try! realm.write {
            realm.add(peripheralDevice)
        }
        
        
    }
}

class RealmWriteDatabaseScannedPeripherals: UIViewController {
    
    func writeToRealm(uuid:String, name:String, rssi:String){
        
        let realm = try! Realm()
        
        let scannedPeripheral = ScannedPeripheral()
        
        scannedPeripheral.name = name
        scannedPeripheral.uuid = uuid
        scannedPeripheral.rssi = rssi
        scannedPeripheral.timestamp = generateCurrentTimeStamp()
        
        try! realm.write {
            realm.add(scannedPeripheral)
        }
        
        
    }
    
    func generateCurrentTimeStamp () -> String{
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        return (formatter.string(from: Date()) as NSString) as String
        
    }
    
}
