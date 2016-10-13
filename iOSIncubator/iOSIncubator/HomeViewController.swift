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
        prepareAlertForLongRunningSession()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let name = UserDefaults.standard.string(forKey: UserDefaultsKeys.userName.rawValue) {
            self.navigationItem.title = name
        } else {
            promptUserForName()
        }
    }
    
    private func prepareAlertForLongRunningSession() {
        let thirtyMinutesInSeconds = Double(60 * 30)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + thirtyMinutesInSeconds) {
            let alertController = UIAlertController(title: "Take a break!", message: "You've been playing for thirty minutes. Don't you think you should take a break?", preferredStyle: .alert)
            
            let snarkyAction = UIAlertAction(title: "Do I have to?", style: .cancel, handler: nil)
            alertController.addAction(snarkyAction)
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    private func promptUserForName() {
        let alertController = UIAlertController(title: "Name", message: "Please enter your name", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            let nameTextField = alertController.textFields![0] as UITextField
            let userName = nameTextField.text
            
            self.navigationItem.title = userName
            UserDefaults.standard.set(userName, forKey: UserDefaultsKeys.userName.rawValue)
        }
        okAction.isEnabled = false
        alertController.addAction(okAction)
        
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in print("User cancelled") }
        alertController.addAction(cancelAction)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Name"
            
            NotificationCenter.default.addObserver(forName: .UITextFieldTextDidChange, object: textField, queue: OperationQueue.main, using: {_ in
                let textCount = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines).characters.count ?? 0
                let textIsNotEmpty = textCount > 0
                okAction.isEnabled = textIsNotEmpty
            
            })
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

