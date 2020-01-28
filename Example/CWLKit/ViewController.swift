//
//  ViewController.swift
//  CWLKit
//
//  Created by cycweeds on 07/07/2018.
//  Copyright (c) 2018 cycweeds. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero)
        
        tableView.tableFooterView = UIView()
        
        tableView.cwl.registerCell(class: UITableViewCell.self)
        
        
        
        // register
        return tableView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

