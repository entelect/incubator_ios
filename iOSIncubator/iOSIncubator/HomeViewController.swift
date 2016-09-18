//
//  ViewController.swift
//  iOSIncubator
//
//  Created by Keegan Rush on 2016/08/04.
//  Copyright © 2016 Entelect. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func playButtonTapped(sender: AnyObject) {
        print("Play tapped")
    }
    
    @IBAction func viewHistoryButtonTapped(sender: AnyObject) {
        print("View history tapped")
    }

}

