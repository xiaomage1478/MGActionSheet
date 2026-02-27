//
//  ViewController.swift
//  MGActionSheet
//
//  Created by 小马哥 on 05/20/2024.
//  Copyright (c) 2024 小马哥. All rights reserved.
//

import FloatingBottomSheet
import SnapKit
import UIKit
import XMGActionSheet

public class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupUI() {}
}

class MGTitleView: BaseView, MGTitleViewType {
    var viewController: (any FloatingBottomSheet)?
    
    typealias SheetAction = () -> Void
    
    public var viewHeight: CGFloat { line.isHidden ? 70 : 76 }
    public var closeAction: SheetAction?
    public var confirmAction: SheetAction?
    
    public func setTitle(_ title: String) {
        titleLabel.text = title
    }
    
    public var showConfirm: Bool = false {
        didSet {
            confirmButton.isHidden = !showConfirm
        }
    }
    
    public var showBottomLine: Bool = true {
        didSet {
            line.isHidden = !showBottomLine
        }
    }
    
    lazy var titleView = UIView().then {
        $0.addSubview(titleLabel)
        $0.addSubview(closeButton)
        $0.addSubview(confirmButton)
    }
    
    lazy var confirmButton = UIButton().then {
        $0.setTitle("完成", for: .normal)
        $0.setTitleColor(.init(hex: "#007BFF"), for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        //        $0.setBackgroundColor(.init(hex: "#007BFF"), for: .normal)
        //        $0.layerCornerRadius = 14
        $0.isHidden = !showConfirm
    }
    
    lazy var titleLabel = UILabel().then {
        $0.textColor = .init(hex: "#000000")
        $0.font = .systemFont(ofSize: 18, weight: .regular)
        $0.text = ""
    }
    
    lazy var closeButton = UIButton().then {
        $0.setImage(UIImage(systemName: "xmark"), for: .normal)
        $0.tintColor = .black
        $0.addTarget(self, action: #selector(closeTap), for: .touchUpInside)
//        $0.hitTestEdgeInsets = UIEdgeInsets(horizontal: -44, vertical: -44)
    }
    
    lazy var line = UIView().then {
        $0.isHidden = !showBottomLine
        $0.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9254901961, blue: 0.937254902, alpha: 1)
    }
    
    lazy var contentStack = UIStackView(arrangedSubviews: [titleView, line]).then {
        $0.spacing = 0
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fill
    }
    
    override func setupUI() {
        super.setupUI()
        backgroundColor = .white
        addSubview(contentStack)
        contentStack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleView.snp.makeConstraints { make in
            make.width.equalTo(kScreenWidth)
        }
        
        closeButton.snp.makeConstraints { make in
            make.left.equalTo(19)
            make.width.height.equalTo(18)
            make.centerY.equalToSuperview()
        }
        
        confirmButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(22)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        line.snp.makeConstraints { make in
            make.height.equalTo(6)
        }
        layoutIfNeeded()
//        closeButton.rx.tap
//            .subscribe(onNext: { [weak self] _ in
//                self?.closeAction?()
//            })
//            .disposed(by: disposeBag)
//
//        confirmButton.rx.tap
//            .subscribe(onNext: { [weak self] _ in
//                self?.confirmAction?()
//            })
//            .disposed(by: disposeBag)
    }
    
    @objc func closeTap() {
        closeAction?()
        viewController?.dismiss(animated: true)
    }
}

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        MGGlobalConfig.config { ui in
            ui.backgroundColor = .white
            ui.separatorInset = .zero
            ui.cellBackgroundColor = .clear
            ui.selectionBackgroundColor = .red.withAlphaComponent(0.5)
            ui.bottomSheetCornerRadius = 30
        } actionConfig: { action in
            action.destructiveAction = MGActionConfig(titleColor: .green, titleFont: .boldSystemFont(ofSize: 20))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func deleteStyle(_ sender: Any) {
        MGActionSheetBuilder.show(title: "是否删除该条消息？", destructiveTitle: "确定") { _ in
            print("删除了～")
            MGGlobalConfig.config { ui in
                ui.backgroundColor = .white
                ui.cancelSeparatorColor = Ces.color("#F2F3F6")
            } actionConfig: { action in
                action.destructiveAction = MGActionConfig(titleColor: .green, titleFont: .boldSystemFont(ofSize: 20))
            }
        }
    }
    
    @IBAction func normalStyle(_ sender: Any) {
        let titleView = MGTitleView().then {
            $0.setTitle("提醒")
            $0.showBottomLine = true
            $0.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: 70)
        }
        MGActionSheetBuilder()
            .setBottomSheetCornerRadius(30)
            .addAction(title: "退出网页版文件传输助手？", style: .default, isEnable: false)
            .addAction(title: "退出", style: .destructive)
            .setBackgroundColor(.white)
            .setTitleViewHeight(70)
            .setTitleView(titleView)
            .setBottomSheetCornerRadius(10)
//            .addCancleAction()
            .build()
    }
    
    @IBAction func subtitleStyle(_ sender: Any) {
        let titleView = MGTitleView().then {
            $0.setTitle("提醒")
            $0.showBottomLine = true
            $0.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: 70)
        }
        
        MGActionSheetBuilder()
            .addAction(title: "拍摄", subtitle: "照片或视频", style: .default)
            .addAction(title: "自定义选项", style: .custom(MyCustomCell.self), customParam: true)
            .addAction(title: "从手机相册选择1", style: .default)
            .addAction(title: "从手机相册选择2", style: .default)
            .addAction(title: "从手机相册选择3", style: .default)
            .addAction(title: "从手机相册选择4", style: .default)
            .addAction(title: "从手机相册选择5", style: .default)
            .addAction(title: "从手机相册选择6", style: .default)
            .addAction(title: "从手机相册选择7", style: .default)
            .addAction(title: "从手机相册选择8", style: .default)
            .addAction(title: "从手机相册选择9", style: .default)
            .addAction(title: "从手机相册选择10", style: .default)
            .addAction(title: "从手机相册选择11", style: .default)
            .addAction(title: "从手机相册选择12", style: .default)
            .addAction(title: "从手机相册选择13", style: .default)
            .addAction(title: "从手机相册选择14", style: .default)
            .addAction(title: "从手机相册选择15", style: .default)
            .addAction(title: "从手机相册选择16", style: .default)
            .addAction(title: "从手机相册选择17", style: .default)
            .addAction(title: "从手机相册选择18", style: .default)
            .addAction(title: "从手机相册选择19", style: .default)
            .addAction(title: "从手机相册选择20", style: .default)
            .addAction(title: "从手机相册选择21", style: .default)
            .addAction(title: "从手机相册选择22", style: .default)
//            .addCancleAction()
            .setTitleViewHeight(70)
            .setTitleView(titleView)
            .build()
    }
    
    @IBAction func actionHeight(_ sender: Any) {
        MGActionSheetBuilder()
            .addAction(title: "退出网页版文件传输助手？", style: .default, config: MGActionConfig(titleFont: .systemFont(ofSize: 16, weight: .medium), isAutoHeight: false, actionHeight: 80), isEnable: false)
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
        present(vc, animated: true)
    }
}

public extension MGActionSheetBuilder {
    static func show(title: String, destructiveTitle: String, destructiveHandle: ((MGAction) -> Void)?) {
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

class MyCustomCell: CustomCellProvider {
    static var reuseCellId: String { "MyCustomCell" }
    
    lazy var checkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "checkmark")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .systemBlue
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.backgroundColor = .red
        return imageView
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        
    }

    // MARK: - Setup

    override func setupUI() {
        super.setupUI()
        contentView.addSubview(checkImageView)
        contentView.bringSubviewToFront(checkImageView)
        
        checkImageView.snp.makeConstraints { make in
            make.trailing.equalTo(-16)
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: 20, height: 20))
        }
    }
    
    override func config(_ data: MGAction) {
        super.config(data)
        contentView.backgroundColor = .clear
    }
}
