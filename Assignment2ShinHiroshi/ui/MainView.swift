//
//  MainView.swift
//  Assignment2ShinHiroshi
//
//  Created by 沈洋 on 2019/11/19.
//  Copyright © 2019 JFX. All rights reserved.
//

import Foundation
import UIKit

class MainView: UIView {
    private var lblLastLogin: UILabel!
    private var btnLogin: UIButton!
    private var btnLogout: UIButton!
    private var btnSettings: UIButton!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let settingSize = btnSettings.sizeThatFits(CGSize.zero)
        let loginSize = btnLogin.sizeThatFits(CGSize.zero)
        btnSettings.frame = CGRect(x: self.frame.width - settingSize.width - 10,
                                   y: 10,
                                   width: settingSize.width,
                                   height: self.frame.height - 20)
        
        if btnLogout == nil || btnLogout.isHidden {
            btnLogin.frame = CGRect(x: btnSettings.frame.origin.x - loginSize.width - 10,
                                    y: 10,
                                    width: loginSize.width,
                                    height: self.frame.height - 20)
        } else {
            btnLogin.frame = CGRect(x: btnLogout.frame.origin.x - loginSize.width - 10,
                                    y: 10,
                                    width: loginSize.width,
                                    height: self.frame.height - 20)
        }
        
        if btnLogin.isHidden {
            lblLastLogin.frame = CGRect(x: 10,
                                        y: 10,
                                        width: btnLogout.frame.origin.x - 20,
                                        height: self.frame.height - 20)
        } else {
            lblLastLogin.frame = CGRect(x: 10,
                                        y: 10,
                                        width: btnLogin.frame.origin.x - 20,
                                        height: self.frame.height - 20)
        }
        
        self.frame.size.width = superview!.frame.width
        self.center.x = superview!.center.x
        self.center.y = superview!.center.y
    }
    
    override init(frame: CGRect) {
        //各View初期化
        super.init(frame: frame)
        self.frame = frame
        lblLastLogin = addLabel(text: "前回ログイン日時　2019/11/07 12:00:00")
        btnLogin = addButton(title: "ログイン")
        btnSettings = addButton(title: "各種設定")
        //MainViewに追加
        self.addSubview(btnSettings)
//        self.addSubview(btnLogout)
        self.addSubview(btnLogin)
        self.addSubview(lblLastLogin)
        //押下機能追加
        btnLogin.addTarget(self, action: #selector(login(_:)), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addLabel(text: String) -> UILabel {
        let label = UILabel()
        
        label.text = text
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = NSTextAlignment.left
        label.font = .systemFont(ofSize: 16)
        return label
    }
    
    private func addButton(title: String) -> UIButton {
        let button = UIButton()
        
        button.setTitle(title, for: .normal)
        button.setTitleColor(
            .blue,
            for: .normal
        )
        button.titleLabel?.font = .systemFont(ofSize: 16)
        return button
    }
    
    @IBAction func login(_ sender: Any) {
        btnLogin.isHidden = true
        
        if btnLogout == nil {
            btnLogout = addButton(title: "ログアウト")
            self.addSubview(btnLogout)
            btnLogout.addTarget(self, action: #selector(logout(_:)), for: .touchUpInside)
            
            let logoutSize = btnLogout.sizeThatFits(CGSize.zero)
            btnLogout.frame = CGRect(x: btnSettings.frame.origin.x - logoutSize.width - 10, y: 10, width: logoutSize.width, height: self.frame.height - 20)
        } else {
            btnLogout.isHidden = false
        }
        
        self.setNeedsLayout()
    }
    
    @IBAction func logout(_ sender: Any) {
        btnLogout.isHidden = true
        btnLogin.isHidden = false
        self.setNeedsLayout()
    }
    
}
