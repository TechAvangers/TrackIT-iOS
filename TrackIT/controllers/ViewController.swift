//
//  ViewController.swift
//  TrackIT
//
//  Created by Laima Cernius-Ink on 3/25/20.
//  Copyright © 2020 Steve Ink. All rights reserved.
//

import UIKit
import Lottie
import CoreBluetooth

class ViewController: UIViewController {
    
    var peripheralManager: CBPeripheralManager!
    var centralManager: CBCentralManager!
    
    var service: CBUUID!
    
    var discoverdPeriperals = [String:String]()
    var discoverdPeripheralsDictionary = [[String:String]]()
    var countDiscoverdPeripherals = [String]()
    
    let animationView = AnimationView()
    let home = UILabel()
    let lbl = UILabel()
    let screenSize: CGRect = UIScreen.main.bounds
    let view1 = UIView()
    let lbl1 = UITextView()
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        centralManager = CBCentralManager(delegate: self, queue: nil)
        peripheralManager = CBPeripheralManager(delegate: self, queue: nil)
        
        
        _ = screenSize.width
        _ = screenSize.height
        
        _ = hexStringToUIColor(hex: "#2792FF")
        _ = hexStringToUIColor(hex: "#7EBFFF")
        

        home.text =  "Tracking..."
        home.textColor = .black
        home.frame.size.width = 200
        home.frame.size.height = 75
        home.center.x = 130
        home.center.y = 90
        home.textColor = .none
        home.font = .boldSystemFont(ofSize: 35)
        
        
        view.addSubview(home)
        let animation = Animation.named("lf30_editor_SKZ870", subdirectory: "")
        
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.frame.size.width = 600
        animationView.frame.size.height = 600
        animationView.center.x = view.center.x
        animationView.center.y = view.center.y
        
        view.addSubview(animationView)
        
        lbl.text = "..."
        lbl.font = .boldSystemFont(ofSize: 25)
        lbl.sizeToFit()
        lbl.textAlignment = .center
        lbl.center.x = view.center.x
        lbl.center.y = view.center.y
        lbl.numberOfLines = 0
        lbl.textColor = .white
        
        view.addSubview(lbl)
        
       
    }
    
           
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animationView.play(fromProgress: 0,
                           toProgress: 1,
                           loopMode: LottieLoopMode.loop,
                           completion: { (finished) in
                            if finished {
                                print("Animation Complete")
                            } else {
                                print("Animation cancelled")
                            }
        })
        _ = screenSize.width
        _ = screenSize.height
        _ = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
            if self.home.center.y > 90 {
                
                
                self.home.center.y = 90
                
                
                
            }
            
            if self.home.center.y < -800 {
                
                
                self.home.center.y = -700
                
                
                
            }
        }
        
    }
    @objc func draggedView2(_ sender:UIPanGestureRecognizer){
        _ = screenSize.width
        _ = screenSize.height
        _ = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
            if self.home.center.y > 105 {
                
                
                self.home.center.y = 105
                
                
                
            }
            
            if self.home.center.y < -800 {
                
                
                self.home.center.y = -700
                
                
                
            }
        }

        let translation = sender.translation(in: self.view)
        sender.setTranslation(CGPoint.zero, in: self.view)
        
        UIView.animate(withDuration: 0.4,
                       delay: 0.0,
                       options: [],
                       animations: { [weak self] in
                        self!.home.center = CGPoint(x: self!.home.center.x, y: self!.home.center.y + translation.y * 1.7 )
                        
                        
            }, completion: nil)
        
        UIView.animate(withDuration: 0.4,
                       delay: 0.05,
                       options: [],
                       animations: { [weak self] in
                        self?.animationView.center.y =  self!.home.center.y + 190
                        self?.lbl.center.y =  self!.home.center.y + 190
                        
            }, completion: nil)
        
        UIView.animate(withDuration: 0.3,
                       delay: 0.1,
                       options: [],
                       animations: { [weak self] in
                        self!.view1.center.y =  ((self?.animationView.center.y)!) + 250
                        
                        
            }, completion: nil)
        
    }
}

