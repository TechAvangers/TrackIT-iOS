//
//  settings.swift
//  TrackIT
//
//  Created by Laima Cernius-Ink on 3/25/20.
//  Copyright © 2020 Steve Ink. All rights reserved.
//

import UIKit
import RealmSwift

class DevicesViewController: UIViewController {
    
    @IBOutlet weak var mSegmentedControl: UISegmentedControl!
    @IBOutlet weak var mTableView: UITableView!
    
    
    var scannedPeripherals: Results<ScannedPeripheral>!
    var userPeripherals: Results<UserPeripheralService>!
    
    lazy var realm = try! Realm()
    
    var isMeSegmented:Bool = false
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    var refreshControl = UIRefreshControl()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        self.refreshControl.tintColor = .none
        self.mTableView.addSubview(refreshControl)

        simpleAlert(title: "Process terminated", message: "Tracking process has been terminated!", style: .alert)
        
        if !isMeSegmented {
            
            loadScannedPeripherals()
        }else{
            loadUserPeripherals()
        }

        mTableView.delegate = self
        mTableView.dataSource = self
        
        self.mTableView.reloadData()
        mTableView.tableFooterView = UIView()

    }
    
    @IBAction func mSegmentedControlAction(_ sender: Any) {
        
        switch mSegmentedControl.selectedSegmentIndex {
        case 0:
            
            isMeSegmented = false
            loadScannedPeripherals()
            
        case 1:
            
            isMeSegmented = true
            loadUserPeripherals()
            
        default:
            break
        }
    }
    
    
    func loadScannedPeripherals(){
       
        if refreshControl.isRefreshing {
           
            scannedPeripherals = realm.objects(ScannedPeripheral.self)
            refreshControl.attributedTitle = NSAttributedString(string: "Scanned peripherals count is: \(scannedPeripherals.count)")
            
           
            
            DispatchQueue.main.async {
                self.mTableView.reloadData()
            }
            
            refreshControl.endRefreshing()
            
            
            
        }
        
        DispatchQueue.main.async {
            self.mTableView.reloadData()
        }
        scannedPeripherals = realm.objects(ScannedPeripheral.self)

    }
    
    func loadUserPeripherals(){
        
        
        if refreshControl.isRefreshing {
                  
                   userPeripherals = realm.objects(UserPeripheralService.self)
                   refreshControl.attributedTitle = NSAttributedString(string: "My peripheral count is: \(userPeripherals.count)")
                   
                   DispatchQueue.main.async {
                       self.mTableView.reloadData()
                   }
                   
                   refreshControl.endRefreshing()
                   
               }
        
        DispatchQueue.main.async {
            self.mTableView.reloadData()
        }
        userPeripherals = realm.objects(UserPeripheralService.self)
    }
    
    @objc func refresh (){
        
        
        if !isMeSegmented {
            
            loadScannedPeripherals()
           
            
        }else{
            
            loadUserPeripherals()
        }
        
    }
}

extension DevicesViewController: UITableViewDataSource, UITableViewDelegate {

   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if !isMeSegmented {
            return scannedPeripherals.count
        }else{
            return userPeripherals.count
        }
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        var scannedPeripheralsCell: ScannedItemsTableViewCell
        var userPeripheralsCell: MyPeripheralsTableViewCell
        
        if !isMeSegmented{
            
            let result = scannedPeripherals[indexPath.row]
            scannedPeripheralsCell = tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath) as! ScannedItemsTableViewCell
            
            scannedPeripheralsCell.mUUIDLabel.text = result.uuid
            scannedPeripheralsCell.mRSSILabel.text = "RSSI: \(result.rssi!)"
            scannedPeripheralsCell.mDateLabel.text = result.timestamp
            scannedPeripheralsCell.isUserInteractionEnabled = false
            
            return scannedPeripheralsCell
                   
        }else{
            
            let result = userPeripherals[indexPath.row]
            userPeripheralsCell = tableView.dequeueReusableCell(withIdentifier: "meCell", for: indexPath) as! MyPeripheralsTableViewCell
            
            userPeripheralsCell.mUUIDLabel.text = result.generatedUUID
            userPeripheralsCell.isUserInteractionEnabled = false
            
            return userPeripheralsCell
            
        }
       
    }

}
