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
        let logoutSize = btnSettings.sizeThatFits(CGSize.zero)
        let loginSize = btnSettings.sizeThatFits(CGSize.zero)
        let lblLastLoginSize = btnSettings.sizeThatFits(CGSize.zero)
        btnSettings.frame = CGRect(x: self.frame.width - settingSize.width - 10, y: 10, width: settingSize.width, height: settingSize.height)
        btnLogout.frame = CGRect(x: btnSettings.frame.origin.x - logoutSize.width - 10, y: 10, width: logoutSize.width, height: logoutSize.height)
        btnLogin.frame = CGRect(x: btnLogout.frame.origin.x - loginSize.width - 10, y: 10, width: loginSize.width, height: loginSize.height)
        lblLastLogin.frame = CGRect(x: 10, y: 10, width: btnLogin.frame.origin.x - 20, height: lblLastLoginSize.height)
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
        btnLogout = addButton(title: "ログアウト")
        btnSettings = addButton(title: "各種設定")
        //MainViewに追加
        self.addSubview(lblLastLogin)
        self.addSubview(btnLogin)
        self.addSubview(btnLogout)
        self.addSubview(btnSettings)
        //押下機能追加
        btnLogin.addTarget(self, action: #selector(login(_:)), for: .touchUpInside)
        btnLogout.addTarget(self, action: #selector(logout(_:)), for: .touchUpInside)
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
        if btnLogout.isHidden {
            btnLogout.isHidden = false
        }
        btnLogin.frame.origin.x = btnLogout.frame.origin.x
        lblLastLogin.frame.size.width = btnLogout.frame.origin.x - lblLastLogin.frame.origin.x
    }
    
    @IBAction func logout(_ sender: Any) {
        btnLogout.isHidden = true
        if btnLogin.isHidden {
            btnLogin.isHidden = false
        }
        btnLogin.frame.origin.x = btnSettings.frame.origin.x - (btnLogin.frame.width + 10)
        lblLastLogin.frame.size.width = btnLogout.frame.origin.x - lblLastLogin.frame.origin.x
    }
    
}
