//
//  MGGlobalAction.swift
//  XMGActionSheet
//
//  Created by xiaomage on 2024/8/28.
//

import Foundation
import UIKit

public typealias UIConfiguration = (MGGlobalUIConfig)->Void
public typealias ActionConfiguration = (MGGlobalAction)->Void


public class MGGlobalConfig {
    public static func config(uiConfig: UIConfiguration, actionConfig: ActionConfiguration) {
        uiConfig(MGGlobalUIConfig.shared)
        actionConfig(MGGlobalAction.shared)
    }
}


public class MGGlobalUIConfig {
    public static let shared = MGGlobalUIConfig()
    
    public var titleColor: UIColor = #colorLiteral(red: 0.2156862745, green: 0.2156862745, blue: 0.2156862745, alpha: 1)
    public var titleFont: UIFont = .systemFont(ofSize: 16, weight: .regular)
    
    /// title 和 subtitle 的间距
    public var spacing: CGFloat = 4
    /// 全局配置背景颜色
    public var backgroundColor: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    public var cellBackgroundColor: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    public var selectionBackgroundColor: UIColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.5547392384)
    
    public var subtitleColor: UIColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    public var subtitleFont: UIFont = .systemFont(ofSize: 12, weight: .regular)
    
    public var separatorColor: UIColor = #colorLiteral(red: 0.9098039216, green: 0.9098039216, blue: 0.9098039216, alpha: 1)
    public var separatorHeight: CGFloat = Ces.px1
    /// 默认底部，左右边距 12 ,  ⚠️top 设置不生效
    public var separatorInset: UIEdgeInsets = .init(top: 0, left: 12, bottom: 0, right: 12)
    
    public var isAutoHeight: Bool = true
    
    public var actionHeight: CGFloat = UITableView.automaticDimension
    public var actionMinHeight: CGFloat = 55
    
    public var cancelSeparatorColor: UIColor = Ces.color("#F2F3F6")
    public var cancelSeparatorHeight: CGFloat = 5
}


public class MGGlobalAction {
     public static var shared = MGGlobalAction()
    
    /// 全局配置默认的 Action 样式
     public var defaultAction: MGActionConfig = .init()
    /// 全局配置警告的 Action 样式
     public var destructiveAction: MGActionConfig = .init(titleColor: .red, titleFont: .systemFont(ofSize: 16))
    /// 全局配置取消按钮的 Action 样式
     public var cancelAction: MGActionConfig = .init(titleFont: .systemFont(ofSize: 16))
}
