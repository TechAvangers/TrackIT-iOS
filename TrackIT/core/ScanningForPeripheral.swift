//
//	ScanningForPeripheral
//	TrackIT
//
//	Created by: Nedim on 27/03/2020
//	Copyright © 2019 bicom. All rights reserved.
//

import Foundation
import CoreBluetooth


extension ViewController: CBCentralManagerDelegate{
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        
          switch central.state {
              
              case .unknown:
                  simpleAlert(title: "Bluetooth error unknown!",
                              message: "Unknown Bluetooth error, please close application and try again!", style: .alert)
              
              case .unsupported:
                    simpleAlert(title: "Bluetooth unsupported!",
                              message: "Sorry, you can't use this app without Bluetooth connection!", style: .alert)
              
              case .unauthorized:
                     simpleAlert(title: "Bluetooth unauthorized!",
                              message: "Bluetooth is not authorized!", style: .alert)
              
              case .resetting:
                    simpleAlert(title: "Bluetooth resetting!",
                              message: "Bluetooth state is resetting", style: .alert)
              
              case .poweredOff:
                   simpleAlert(title: "Bluetooth is turned off!",
                              message: "You have to turn on Bluetooth to prossed", style: .actionSheet)
              
              case .poweredOn:
                   
                schedulTimer(interval: 10.0)
              
              @unknown default:
                  print("Unknown State")
              }
    }
    
    @objc func scan() {
        centralManager.scanForPeripherals(withServices: nil)
        
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral,
                        advertisementData: [String: Any], rssi RSSI: NSNumber) {
       
        let peripheralName = peripheral.name ?? "No name"
        let peripheralUUID = peripheral.identifier.uuidString
        let peripheralRSSI = RSSI.stringValue
        
        let realmWriteDatabase = RealmWriteDatabaseScannedPeripherals()

        
        if !countDiscoverdPeripherals.contains(peripheralUUID){
            
            countDiscoverdPeripherals.append(peripheralUUID)
            
            discoverdPeriperals["name"] = peripheralName
            discoverdPeriperals["uuid"] = peripheralUUID
            discoverdPeriperals["rssi"] = peripheralRSSI
            
            discoverdPeripheralsDictionary.append(discoverdPeriperals)
            
            
            
                
            realmWriteDatabase.writeToRealm(uuid: peripheralUUID, name: peripheralName, rssi: peripheralRSSI)
                
            lbl.text = "\(countDiscoverdPeripherals.count)"
                
        

            
        }

        central.stopScan()
    }
    
    func schedulTimer(interval:Double){
        
        let timer = Timer.scheduledTimer(timeInterval: interval,
        target: self,
        selector: Selector(("scan")),
        userInfo: nil,
        repeats: true)
        
        timer.fire()
    }
    
}
