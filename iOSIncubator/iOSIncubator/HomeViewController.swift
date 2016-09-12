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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        promptUserForName()
    }
    
    private func promptUserForName() {
        let alertController = UIAlertController(title: "Name", message: "Please enter your name", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            let nameTextField = alertController.textFields![0] as UITextField
            self.navigationItem.title = nameTextField.text
        }
        alertController.addAction(okAction)
        
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in print("User cancelled") }
        alertController.addAction(cancelAction)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Name"
        }
        
        alertController.view.setNeedsLayout()
        self.present(alertController, animated: true, completion: nil)
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

