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
    private let lblLastLogin = UILabel()
    private let btnLogin = UIButton()
    private let btnLogout = UIButton()
    private let btnSettings = UIButton()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let settingSize = btnSettings.sizeThatFits(CGSize.zero)
        let loginSize = btnLogin.sizeThatFits(CGSize.zero)
        let logoutSize = btnLogout.sizeThatFits(CGSize.zero)
        btnSettings.frame = CGRect(x: self.frame.width - settingSize.width - 10,
                                   y: 10,
                                   width: settingSize.width,
                                   height: self.frame.height - 20)
        btnLogout.frame = CGRect(x: btnSettings.frame.origin.x - logoutSize.width,
                                 y: 10,
                                 width: logoutSize.width,
                                 height: self.frame.height - 20)
        
        if btnLogout.isHidden {
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
        self.setLabel(label: lblLastLogin, text: "前回ログイン日時　2019/11/07 12:00:00")
        self.setButton(button: btnLogin, title: "ログイン")
        self.setButton(button: btnLogout, title: "ログアウト")
        self.setButton(button: btnSettings, title: "各種設定")
        btnLogout.isHidden = true
        //MainViewに追加
        self.addSubview(btnSettings)
        self.addSubview(btnLogin)
        self.addSubview(btnLogout)
        self.addSubview(lblLastLogin)
        //押下機能追加
        btnLogin.addTarget(self, action: #selector(login(_:)), for: .touchUpInside)
        btnLogout.addTarget(self, action: #selector(logout(_:)), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setLabel(label: UILabel, text: String) {
        label.text = text
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = NSTextAlignment.left
        label.font = .systemFont(ofSize: 16)
    }
    
    private func setButton(button: UIButton, title: String) {
        button.setTitle(title, for: .normal)
        button.setTitleColor(
            .blue,
            for: .normal
        )
        button.titleLabel?.font = .systemFont(ofSize: 16)
    }
    
    @IBAction func login(_ sender: Any) {
        btnLogin.isHidden = true
        btnLogout.isHidden = false
        self.setNeedsLayout()
    }
    
    @IBAction func logout(_ sender: Any) {
        btnLogout.isHidden = true
        btnLogin.isHidden = false
        self.setNeedsLayout()
    }
    
}
