//
//  InterfaceController.swift
//  Yoga_Frolenkov WatchKit Extension
//
//  Created by Timofey on 15.01.2022.
//  Copyright © 2022 Timofey. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

//class InterfaceController: WKInterfaceController, WCSessionActivationState {

   
class InterfaceController: WKInterfaceController, WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
    
    }
    
    func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any]) {
        let message = applicationContext["name"] as? String
        let time = applicationContext["time"] as? Double
        name.setText(message)
        timer.setDate(NSDate(timeIntervalSinceNow: time!)as Date)
        timer.start()
    }
    
    var wcSession: WCSession!
       
       @IBOutlet weak var name: WKInterfaceLabel!
       @IBOutlet weak var image: WKInterfaceImage!
       @IBOutlet weak var timer: WKInterfaceTimer!
    override func awake(withContext context: Any?) {
//        super.awake(withContext: context)
        wcSession = WCSession.default
        wcSession.delegate = self
        wcSession.activate()
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}


