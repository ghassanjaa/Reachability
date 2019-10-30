//
//  ViewController.swift
//  Reachability
//
//  Created by Ghassan Jaam on 10/30/19.
//  Copyright © 2019 Ghassan Jaam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Reachablity is a simple framework to monitor the network state of an iOS device.
    
    //Add a Reachablity attribute to the view controller.
    var reachability: Reachability!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Initialize the Reachablity object.
        reachability = try! Reachability()
        
        //Check if we're reachable.
        reachability.whenReachable = { reachability in
            
            //Return to the main thread after the reachablity of network is obtained.
            DispatchQueue.main.async {
                //Check if we are connected WiFi.
                if reachability.connection == .wifi {
                    print("connected via wifi")
                } else {
                    print("connected via cellular")
                }
            }
        }
        reachability.whenUnreachable = { reachability in
            //Check if we're not reachable.
            DispatchQueue.main.async {
                print("not reachable")
            }
        }
        
        //After calling Reachability startNotifier, the Network status changes.
        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }
    
    //Call stopNotifier() in deinit method for stopping notifications.
    deinit {
        reachability.stopNotifier()
    }
}

