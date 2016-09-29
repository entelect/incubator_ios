//
//  GameViewController.swift
//  iOSIncubator
//
//  Created by Keegan Rush on 2016/09/26.
//  Copyright © 2016 Entelect. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, HeapDelegate {
    
    @IBOutlet weak var heapStackView: UIStackView!
    
    var heapViewControllers: [HeapViewController]!
    
    override func viewWillAppear(_ animated: Bool) {
        heapViewControllers = [HeapViewController(delegate: self), HeapViewController(delegate: self), HeapViewController(delegate: self)]
        
        for heap in heapViewControllers {
            self.addChildViewController(heap)
            heapStackView.addArrangedSubview(heap.view)
        }
    }
    
    override func awakeFromNib() {
        print("Awake")
    }
    
    // MARK: - HeapDelegate
    
    func tokensTaken(from heapView: HeapViewController) {
        
    }
    
    func changedStepperValue(for heapView: HeapViewController) {
        let otherHeaps = heapViewControllers.filter({return $0 != heapView})
        
        for heap in otherHeaps {
            heap.tokensToTakeStepper.value = 0
            heap.setLabelsText()
        }
    }
}
