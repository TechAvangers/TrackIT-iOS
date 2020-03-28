//
//	ScanDevicesService
//	TrackIT
//
//	Created by: Nedim on 27/03/2020
//	Copyright © 2020 tech avangers. All rights reserved.
//

import Foundation
import CoreBluetooth

extension ViewController : CBPeripheralManagerDelegate {
    
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
            
        switch peripheral.state {
            
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
                createService()
            
            @unknown default:
                print("Unknown State")
            }
    }
    
    
    func createService(){
                
        let characteristic = CBMutableCharacteristic(type: CBUUID(nsuuid: UUID()), properties: [.notify,.read], value: nil, permissions: [.readable,.writeable])
        
        self.service = CBUUID(nsuuid: UUID())
        let createdService = CBMutableService(type: service, primary: true)
        
        createdService.characteristics = [characteristic]
        peripheralManager.add(createdService)
        
        if(advertiseService()){
            print("Advertising \(service.uuidString)")
            
            let realmWriteToDatabase = RealmWriteDatabasePeripheralDevice()
            realmWriteToDatabase.writeToRealm(generatedUUID: service.uuidString)
            
        }else{
            
            simpleAlert(title: "Internal service error", message: "Sorry, you can not use app, there is internal service error!", style: .alert)
            exit(0)
        }
        
    }
    
    func advertiseService() -> Bool{
        
        peripheralManager.startAdvertising([CBAdvertisementDataLocalNameKey : "TrackIT-ID\(randomizeAlpaNumericString())", CBAdvertisementDataServiceUUIDsKey :     [service]])
        
        return true
        
    }
    
}
