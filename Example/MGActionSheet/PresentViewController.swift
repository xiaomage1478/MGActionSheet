//
//  PresentViewController.swift
//  MGActionSheet_Example
//
//  Created by xiaomage on 2024/5/21.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import UIKit
import XMGActionSheet

class PresentViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        let button = UIButton(type: .custom)
        button.setTitle("弹框", for: .normal)
        button.frame = CGRect(x: 100, y: 100, width: 80, height: 40)
        button.addTarget(self, action: #selector(showAction), for: .touchUpInside)
        self.view.addSubview(button)
        
    }
    
    @objc func showAction() {
        MGActionSheetBuilder.show(title: "是否删除该条消息？", destructiveTitle: "确定") { _ in
            print("删除了～")
            self.dismiss(animated: true)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
