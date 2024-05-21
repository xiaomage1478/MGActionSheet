//
//  ViewController.swift
//  MGActionSheet
//
//  Created by 小马哥 on 05/20/2024.
//  Copyright (c) 2024 小马哥. All rights reserved.
//

import XMGActionSheet
import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func deleteStyle(_ sender: Any) {
        MGActionSheetBuilder.show(title: "是否删除该条消息？", destructiveTitle: "确定") { _ in
            print("删除了～")
        }
    }
    
    @IBAction func normalStyle(_ sender: Any) {
        MGActionSheetBuilder()
            .addAction(title: "退出网页版文件传输助手？", style: .default, isEnable: false)
            .addAction(title: "退出", style: .destructive)
            .addCancleAction()
            .build()
    }
    
    @IBAction func subtitleStyle(_ sender: Any) {
        MGActionSheetBuilder()
            .addAction(title: "拍摄", subtitle: "照片或视频", style: .default)
            .addAction(title: "从手机相册选择", style: .default)
            .addCancleAction()
            .build()
    }
    
    @IBAction func actionHeight(_ sender: Any) {
        MGActionSheetBuilder()
            .addAction(title: "退出网页版文件传输助手？", style: .default, config: MGActionConfig(titleFont: .systemFont(ofSize: 16, weight: .medium),isAutoHeight: false, actionHeight: 80), isEnable: false)
            .addAction(title: "退出", style: .destructive)
            .addCancleAction()
            .build()
    }
    
    
    @IBAction func showActionSheet(_ sender: Any) {
        MGActionSheetBuilder()
            .addAction(title: "退出网页版文件传输助手？", subtitle: "请注意危险", style: .default, isEnable: false)
            .addAction(title: "退出", style: .destructive)
            .addCancleAction()
            .build()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let vc = PresentViewController()
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .automatic
        self.present(vc, animated:  true)
    }
}


extension MGActionSheetBuilder {
    public static func show(title: String, destructiveTitle: String, destructiveHandle: ((MGAction) -> Void)?) {
        let titleColor = #colorLiteral(red: 0.370662272, green: 0.3664324582, blue: 0.3663428426, alpha: 1)
        let titleConfig = MGActionConfig(titleColor: titleColor, titleFont: .systemFont(ofSize: 12))
        
        let destructiveColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        let destructiveConfig = MGActionConfig(titleColor: destructiveColor, titleFont: .systemFont(ofSize: 16))
        
        let cancelColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        let cancelConfig = MGActionConfig(titleColor: cancelColor, titleFont: .systemFont(ofSize: 16))
        
        MGActionSheetBuilder()
            .addAction(title: title, style: .default, config: titleConfig, isEnable: false)
            .addAction(title: destructiveTitle, style: .destructive, config: destructiveConfig, handler: destructiveHandle)
            .addCancleAction(config: cancelConfig)
            .build()
    }
}
