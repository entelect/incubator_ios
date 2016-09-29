//
//  HeapView.swift
//  iOSIncubator
//
//  Created by Keegan Rush on 2016/09/26.
//  Copyright © 2016 Entelect. All rights reserved.
//

import UIKit

protocol HeapDelegate: class {
    func changedStepperValue(for heapView: HeapViewController)
    func tokensTaken(from heapView: HeapViewController)
}

class HeapViewController: UIViewController {
    
    @IBOutlet weak var remainingTokensAmountLabel: UILabel!
    @IBOutlet weak var tokensToTakeLabel: UILabel!
    @IBOutlet weak var tokensToTakeStepper: UIStepper!
    @IBOutlet weak var takeTokensButton: UIButton!
    
    var remainingTokens = 25
    
    weak var delegate: HeapDelegate?
    
    init(delegate: HeapDelegate) {
        self.delegate = delegate
        super.init(nibName: String(describing: HeapViewController.self), bundle: Bundle.main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func tokenStepperValueChanged(_ sender: AnyObject) {
    setLabelsText()
    delegate?.changedStepperValue(for: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setLabelsText()
        tokensToTakeStepper.maximumValue = Double(remainingTokens)
    }
    
    @IBAction func takeTokensTapped(_ sender: AnyObject) {
        guard tokensToTakeStepper.value > 0 else { return }
        
        remainingTokens -= Int(tokensToTakeStepper.value)
        tokensToTakeStepper.value = 0
        tokensToTakeStepper.maximumValue = Double(remainingTokens)
            
        setLabelsText()
    }
    
    func setLabelsText() {
        remainingTokensAmountLabel.text = String(remainingTokens)
        tokensToTakeLabel.text = String(Int(tokensToTakeStepper.value))
    }
    
}
