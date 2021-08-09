//
//  ScanViewController.swift
//  QRcodeFunctionalityTask
//
//  Created by CRS on 9.8.21.
//

import AVFoundation
import UIKit


protocol ScanProtocol {
    
    
    //var resultCode:String? { get set }
    
    func showResult(result: String)
        
}


class ScanViewController: UIViewController , AVCaptureMetadataOutputObjectsDelegate {

    
    
    var containerViewDelegate: ScanProtocol?
    
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    

}
