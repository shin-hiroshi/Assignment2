//
//  MainView.swift
//  Assignment2ShinHiroshi
//
//  Created by 沈洋 on 2019/11/15.
//  Copyright © 2019 JFX. All rights reserved.
//

import UIKit

class MainView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    private var lblLastLogin: UILabel!
    private var btnLogin: UIButton!
    private var btnLogout: UIButton!
    private var btnSettings: UIButton!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //各View初期化
        lblLastLogin = addLabel(text: "前回ログイン日時　2019/11/07 12:00:00")
        btnLogin = addButton(title: "ログイン")
        btnLogout = addButton(title: "ログアウト")
        btnSettings = addButton(title: "各種設定")
        //MainViewに追加
        self.addSubview(lblLastLogin)
        self.addSubview(btnLogin)
        self.addSubview(btnLogout)
        self.addSubview(btnSettings)
        //関数追加
        btnLogin.addTarget(self, action: #selector(login(_:)), for: .touchUpInside)
        btnLogout.addTarget(self, action: #selector(logout(_:)), for: .touchUpInside)
        //Styleを調整
        self.btnSettingsLayout()
        self.btnLogoutLayout()
        self.btnLoginLayout()
        self.lblLastLoginLayout()
        
//        lblLastLogin.frame = CGRect(x: 10, y: 10, width: self.frame.width / 5 * 2, height: self.frame.height - 20)
//        btnLogin.frame = CGRect(x: lblLastLogin.frame.width + lblLastLogin.frame.origin.x + 10, y: 10, width: self.frame.width / 5 * 2, height: self.frame.height - 20)
//        btnLogout.frame = CGRect(x: btnLogin.frame.width + btnLogin.frame.origin.x + 10, y: 10, width: self.frame.width / 5, height: self.frame.height - 20)
//        btnSettings.frame = CGRect(x: btnLogout.frame.width + btnLogout.frame.origin.x + 10, y: 10, width: self.frame.width / 5, height: self.frame.height - 20)
        
    }
    
    private func addLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textAlignment = NSTextAlignment.left
//        label.frame.size.width = self.frame.width / 5 * 2
        label.frame.size.height = self.frame.height - 20
        label.font = .systemFont(ofSize: 16)
        return label
    }
    
    private func addButton(title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
//        button.frame.size.width = self.frame.width / 5
        button.sizeToFit()
        button.frame.size.height = self.frame.height - 20
        button.setTitleColor(
            .blue,
            for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        return button
    }

    private func lblLastLoginLayout() {
        lblLastLogin.frame.origin.x = 10
        lblLastLogin.frame.origin.y = 10
        lblLastLogin.frame.size.width = btnLogin.frame.origin.x - 10
    }

    private func btnLoginLayout() {
        btnLogin.frame.origin.x = btnLogout.frame.origin.x - btnLogin.frame.width - 10
        btnLogin.frame.origin.y = 10
    }

    private func btnLogoutLayout() {
        btnLogout.frame.origin.x = btnSettings.frame.origin.x - btnLogout.frame.width - 10
        btnLogout.frame.origin.y = 10
    }

    private func btnSettingsLayout() {
        btnSettings.frame.origin.x = self.frame.width - (btnSettings.frame.width)
        btnSettings.frame.origin.y = 10
    }
    
    @IBAction func login(_ sender: Any) {
        btnLogin.isHidden = true
//        btnLogin.frame.size.width = 0
        if btnLogout.isHidden {
            btnLogout.isHidden = false
        }
//        lblLastLogin.frame.size.width = btnLogout.frame.origin.x - 10
        
//        lblLastLogin.sizeToFit()
    }
    
    @IBAction func logout(_ sender: Any) {
        btnLogout.isHidden = true
//        btnLogout.frame.size.width = 0
        if btnLogin.isHidden {
            btnLogin.isHidden = false
        }
//        btnLogin.frame.origin.x = btnSettings.frame.origin.x - btnLogin.frame.width
//        lblLastLogin.frame.size.width = btnLogin.frame.origin.x - 10
    }
}
