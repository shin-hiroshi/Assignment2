//
//  ViewController.swift
//  Assignment2ShinHiroshi
//
//  Created by 沈洋 on 2019/11/15.
//  Copyright © 2019 JFX. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var mainView: MainView1!
    private var lblLastLogin: PaddingLabel!
    private var btnLogin: UIButton!
    private var btnLogout: UIButton!
    private var btnSettings: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //各View初期化
        mainView = MainView1(
            frame: CGRect(
                x: 0,
                y: self.view.center.y,
                width: self.view.frame.width,
                height: 300
        ))
        self.view.addSubview(mainView)
        lblLastLogin = addLabel(text: "前回ログイン日時　2019/11/07 12:00:00")
        btnLogin = addButton(title: "ログイン")
        btnLogout = addButton(title: "ログアウト")
        btnSettings = addButton(title: "各種設定")
        //MainViewに追加
        mainView.addSubview(lblLastLogin)
        mainView.addSubview(btnLogin)
        mainView.addSubview(btnLogout)
        mainView.addSubview(btnSettings)
        //押下機能追加
        btnLogin.addTarget(self, action: #selector(login(_:)), for: .touchUpInside)
        btnLogout.addTarget(self, action: #selector(logout(_:)), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        mainView.center.x = self.view.center.x
        mainView.center.y = self.view.center.y
        mainView.frame.size.width = self.view.frame.width
        //位置調整
        self.btnSettingsLayout()
        self.btnLogoutLayout()
        self.btnLoginLayout()
        self.lblLastLoginLayout()
    }
    
    private func addLabel(text: String) -> PaddingLabel {
        let label = PaddingLabel()
        label.text = text
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = NSTextAlignment.left
        label.frame.size.height = mainView.frame.height - 20
        label.font = .systemFont(ofSize: 16)
        return label
    }
    
    private func addButton(title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.sizeToFit()
        button.frame.size.height = mainView.frame.height - 20
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
        btnLogin.frame.origin.x = btnLogout.frame.origin.x - (btnLogin.frame.width + 10)
        btnLogin.frame.origin.y = 10
        btnLogin.frame.size.height = mainView.frame.height - 20
    }

    private func btnLogoutLayout() {
        btnLogout.frame.origin.x = btnSettings.frame.origin.x - (btnLogout.frame.width + 10)
        btnLogout.frame.origin.y = 10
        btnLogout.frame.size.height = mainView.frame.height - 20
    }

    private func btnSettingsLayout() {
        btnSettings.frame.origin.x = mainView.frame.width - (btnSettings.frame.width + 10)
        btnSettings.frame.origin.y = 10
        btnSettings.frame.size.height = mainView.frame.height - 20
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

