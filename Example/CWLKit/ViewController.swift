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

        minWindow("ABCDABC", "AB")
    }
    
    func minWindow ( _ S: String,  _ T: String) -> String {
            // write code here
        
        let pattern = T.map { String($0) }.joined(separator: ".*")
        print(pattern)
        do {
            let expression = try NSRegularExpression.init(pattern: pattern, options: .allowCommentsAndWhitespace)
            expression.enumerateMatches(in: S, options: .reportProgress, range: NSRange(location: 0, length: S.count - 1)) { (result, flags, isStop) in
                if let range = result?.range {
                    let substring = (T as NSString).substring(with: range)
                    
                    print(substring)
                } else {
                    print("Range没找到")
                }
            }
        } catch {
            print(error.localizedDescription)
        }
        
        
        return ""
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

