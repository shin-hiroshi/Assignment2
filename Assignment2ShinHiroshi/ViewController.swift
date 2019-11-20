//
//  ViewController.swift
//  Assignment2ShinHiroshi
//
//  Created by 沈洋 on 2019/11/15.
//  Copyright © 2019 JFX. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let mainView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(mainView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mainView.frame = CGRect(x: 0,
                                y: 0,
                                width: self.view.frame.width,
                                height: 150)
        mainView.center.y = self.view.center.y
    }
}

