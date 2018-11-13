//
//  ViewController.swift
//  CWLKit
//
//  Created by cycweeds on 07/07/2018.
//  Copyright (c) 2018 cycweeds. All rights reserved.
//

import UIKit




class ViewController: UIViewController {

    
    let a = AppDelegate()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        DispatchQueue.main.delay(second: 10, execute: {
            print("234")
        })
        
        DispatchQueue.mainThreadAsync {
            print("这是在主线程中")
        }
        
        
        DispatchQueue.global().async {
            print("这在子主线程中")
            DispatchQueue.mainThreadAsync {
                print("这还是在主线程中")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

