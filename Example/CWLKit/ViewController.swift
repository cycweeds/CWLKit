//
//  ViewController.swift
//  CWLKit
//
//  Created by cycweeds on 07/07/2018.
//  Copyright (c) 2018 cycweeds. All rights reserved.
//

import UIKit






class ViewController: UIViewController {
    
    let sss = UIImageView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sss.backgroundColor = .green
        sss.expandHotPoint = UIEdgeInsets(top: 30, left: 30, bottom: 40, right: 30)
        sss.frame = CGRect(x: 100, y: 100, width: 40, height: 40)
        view.addSubview(sss)
        sss.tag = 111
        sss.isUserInteractionEnabled = true
        sss.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "cfff"))
        
        
        
    }
    
    @objc func cfff() {
        print("当前点击位置")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

