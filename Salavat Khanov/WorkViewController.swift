//
//  WorkTableViewController.swift
//  Salavat Khanov
//
//  Created by Salavat Khanov on 4/16/15.
//  Copyright (c) 2015 Arty Technology. All rights reserved.
//

import UIKit
import StoreKit

class WorkViewController: UIViewController, SKStoreProductViewControllerDelegate {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var iconButton: UIButton!
    @IBOutlet weak var iconButton2: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Pin content view to screen width
        let leftConstraint = NSLayoutConstraint(item: containerView, attribute: .Leading, relatedBy: .Equal, toItem: view, attribute: .Left, multiplier: 1.0, constant: 0)
        let rightConstraint = NSLayoutConstraint(item: containerView, attribute: .Trailing, relatedBy: .Equal, toItem: view, attribute: .Right, multiplier: 1.0, constant: -0)
        view.addConstraints([leftConstraint, rightConstraint])
        
        // Add white borders
        iconButton.layer.borderColor = UIColor.whiteColor().CGColor
        iconButton2?.layer.borderColor = UIColor.whiteColor().CGColor
    }
    
    @IBAction func appStoreButtonPressed(sender: UIButton) {
        let params = [SKStoreProductParameterITunesItemIdentifier: "\(sender.tag)"]
        let storeController = SKStoreProductViewController()
        storeController.delegate = self
        
        storeController.loadProductWithParameters(params) { (result, error) -> Void in
            if result {
                self.presentViewController(storeController, animated: true, completion: nil)
            } else {
                UIAlertView(title: "Uh oh!", message: "There was a problem opening the App Store", delegate: nil, cancelButtonTitle: "OK").show()
            }
        }
    }
    
    func productViewControllerDidFinish(viewController: SKStoreProductViewController!) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}