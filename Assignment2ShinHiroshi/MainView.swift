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
        lblLastLogin = addLabel(text: "前回ログイン日時　2019/11/07 12:00:00")
        btnLogin = addButton(title: "ログイン")
        btnLogout = addButton(title: "ログアウト")
        btnSettings = addButton(title: "各種設定")
        self.addSubview(lblLastLogin)
        self.addSubview(btnLogin)
        self.addSubview(btnLogout)
        self.addSubview(btnSettings)
        self.lblLastLoginLayout()
        self.btnLoginLayout()
        self.btnLogoutLayout()
        self.btnSettingsLayout()
    }
    
    private func addLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textAlignment = NSTextAlignment.left
        label.sizeToFit()
        label.font.withSize(16)
        return label
    }
    
    private func addButton(title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.sizeToFit()
        button.setTitleColor(
            .blue,
            for: .normal)
        button.titleLabel?.font.withSize(16)
        return button
    }

    private func lblLastLoginLayout() {
        lblLastLogin.frame.origin.x = 10
        lblLastLogin.frame.size.height = self.frame.height - 20
    }
    
    private func btnLoginLayout() {
        btnLogin.frame.origin.x = lblLastLogin.frame.origin.x + btnLogin.frame.width + 10
        btnLogin.frame.size.height = self.frame.height - 20
        btnLogin.addTarget(self, action: #selector(login(_:)), for: .touchUpInside)
    }
    
    private func btnLogoutLayout() {
        btnLogout.frame.origin.x = btnLogin.frame.origin.x + (btnLogout.frame.width) + 10
        btnLogout.frame.size.height = self.frame.height - 20
        btnLogout.addTarget(self, action: #selector(logout(_:)), for: .touchUpInside)
    }
    
    private func btnSettingsLayout() {
        btnSettings.frame.origin.x = self.frame.width - (btnSettings.frame.width + 10)
        btnSettings.frame.size.height = self.frame.height - 20
        
    }
    
    @IBAction func login(_ sender: Any) {
        btnLogin.isHidden = true
        if btnLogout.isHidden {
            btnLogout.isHidden = false
        }
    }
    
    @IBAction func logout(_ sender: Any) {
        btnLogout.isHidden = true
        if btnLogin.isHidden {
            btnLogin.isHidden = false
        }
    }
}
