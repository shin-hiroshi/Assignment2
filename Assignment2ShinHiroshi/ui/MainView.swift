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
        //文字を収まる横幅
        let settingWidth = btnSettings.sizeThatFits(CGSize.zero).width
        let loginWidth = btnLogin.sizeThatFits(CGSize.zero).width
        let logoutWidth = btnLogout.sizeThatFits(CGSize.zero).width
//        let settingSize = btnSettings.sizeThatFits(CGSize.zero)
//        let loginSize = btnLogin.sizeThatFits(CGSize.zero)
//        let logoutSize = btnLogout.sizeThatFits(CGSize.zero)
//        let lblLastLoginSize = lblLastLogin.sizeThatFits(CGSize.zero)
        
        //frameの共通引数
        let margin = CGFloat(10)
        let height = self.frame.height - margin * 2
        var position = self.frame.width
        
        //frameを設定
        position -= (settingWidth + margin)
        btnSettings.frame = CGRect(x: position,
                                   y: margin,
                                   width: settingWidth,
                                   height: height)
        if btnLogout.isHidden == false {
            position -= (logoutWidth + margin)
            btnLogout.frame = CGRect(x: position,
                                     y: margin,
                                     width: logoutWidth,
                                     height: height)
        }
        if btnLogin.isHidden == false {
            position -= (loginWidth + margin)
            btnLogin.frame = CGRect(x: position,
                                    y: margin,
                                    width: loginWidth,
                                    height: height)
        }

        position -= 10
        lblLastLogin.frame = CGRect(x: margin,
                                    y: margin,
                                    width: position - 10,
                                    height: height)
        
//        let sizes = [settingSize, logoutSize, loginSize, lblLastLoginSize]
//        let views = [btnSettings, btnLogout, btnLogin, lblLastLogin]
//
//        for (index, size) in sizes.enumerated() {
//            width -= (margin + size.width)
//            let view = views[index]
//            if view.isHidden == false {
//                view.frame = CGRect(x: width, y: margin, width: size.width, height: height)
//            }
//
//        }
    }
    
    override init(frame: CGRect) {
        //各View初期化
        super.init(frame: frame)
        self.frame = frame
        lblLastLogin.text = "前回ログイン日時　2019/11/07 12:00:00"
        lblLastLogin.numberOfLines = 0
        lblLastLogin.lineBreakMode = .byWordWrapping
        lblLastLogin.textAlignment = NSTextAlignment.left
        lblLastLogin.font = .systemFont(ofSize: 16)
        btnLogin.setTitle("ログイン", for: .normal)
        btnLogin.setTitleColor(.blue, for: .normal)
        btnLogin.titleLabel?.font = .systemFont(ofSize: 16)
        btnLogout.setTitle("ログアウト", for: .normal)
        btnLogout.setTitleColor(.blue, for: .normal)
        btnLogout.titleLabel?.font = .systemFont(ofSize: 16)
        btnLogout.isHidden = true
        btnSettings.setTitle("各種設定", for: .normal)
        btnSettings.setTitleColor(.blue, for: .normal)
        btnSettings.titleLabel?.font = .systemFont(ofSize: 16)
        
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
