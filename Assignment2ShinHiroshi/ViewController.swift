//
//  ViewController.swift
//  Assignment2ShinHiroshi
//
//  Created by 沈洋 on 2019/11/15.
//  Copyright © 2019 JFX. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var mainView: MainView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView = MainView(frame: CGRect(x: 0,
                                          y: self.view.center.y,
                                          width: self.view.frame.width,
                                          height: 150))
        self.view.addSubview(mainView)
    }
    
    override func viewDidLayoutSubviews() {
        mainView.layoutSubviews()
        mainView.frame.size.width = self.view.frame.width
        mainView.center.x = self.view.center.x
        mainView.center.y = self.view.center.y
    }
}

