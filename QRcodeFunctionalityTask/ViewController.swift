//
//  ViewController.swift
//  QRcodeFunctionalityTask
//
//  Created by CRS on 9.8.21.
//

import UIKit

class ViewController: UIViewController , ScanProtocol{
    
    

    
    
    
    @IBOutlet var chooseSearchType: UISegmentedControl!
    @IBOutlet var containerViewScan: UIView!
    
    var childQRKodVC : ScanViewController!
    
    @IBOutlet var customerNumberLabel: UILabel!
    @IBOutlet var enterCustomerNumberInputField: UITextField!
    
    var scanActivated: Bool = false
    
    @IBOutlet var contentQRCode: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentQRCode.isHidden = true
        
        childQRKodVC = self.storyboard?.instantiateViewController(withIdentifier: "ScanViewController") as? ScanViewController
        childQRKodVC.containerViewDelegate = self
        
        
    }
    
    
    @IBAction func choosesearch(_ sender: Any) {
        
        
        if chooseSearchType.selectedSegmentIndex == 0 {
            
            contentQRCode.isHidden = true
            customerNumberLabel.isHidden = false
            enterCustomerNumberInputField.isHidden = false
            containerViewScan.isHidden = true
            
            
            if (scanActivated){
                
             childQRKodVC.willMove(toParent: nil)
             childQRKodVC.view.removeFromSuperview()
             childQRKodVC.removeFromParent()
             scanActivated = false
                
            }
            
            
            
        }
        else if chooseSearchType.selectedSegmentIndex == 1{
            
            customerNumberLabel.isHidden = true
            enterCustomerNumberInputField.isHidden = true
            containerViewScan.isHidden = false
            scanActivated = true
            
            addChild(childQRKodVC)
            //Or, you could add auto layout constraint instead of relying on AutoResizing contraints
            childQRKodVC.view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
            childQRKodVC.view.frame = containerViewScan.bounds
            
            containerViewScan.addSubview(childQRKodVC.view)
            childQRKodVC.didMove(toParent: self)
            
        }
        
        
        
        
        
    }
    
    func showResult(result: String) {
        
        
        contentQRCode.text = result
        contentQRCode.isHidden = false
        
    }

    
    

}

