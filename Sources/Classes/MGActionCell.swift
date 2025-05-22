import FloatingBottomSheet
import UIKit
class MGActionCell: UITableViewCell {
    // MARK: - UI Components
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let bottomLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 4
        stack.alignment = .center
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setupUI() {
        contentView.backgroundColor = .white
        
        // 添加视图
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subtitleLabel)
        contentView.addSubview(stackView)
        contentView.addSubview(bottomLine)
        
        // 设置约束
        NSLayoutConstraint.activate([
            // StackView 约束
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            stackView.leadingAnchor.constraint(greaterThanOrEqualTo: contentView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -10),
            
            // 底部线约束
            bottomLine.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            bottomLine.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            bottomLine.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            bottomLine.heightAnchor.constraint(equalToConstant: 1.0 / UIScreen.main.scale),
            
            // 确保最小高度
            contentView.heightAnchor.constraint(greaterThanOrEqualToConstant: 60)
        ])
    }
    
    // MARK: - Configuration
    func config(_ data: MGAction) {
        titleLabel.text = data.title
        subtitleLabel.text = data.subTitle
        
        // 应用自定义样式
        titleLabel.textColor = data.config.titleColor
        titleLabel.font = data.config.titleFont
        subtitleLabel.textColor = data.config.subtitleColor
        subtitleLabel.font = data.config.subtitleFont
        stackView.spacing = data.config.spacing
        contentView.backgroundColor = data.config.backgroundColor
        
        // 更新分割线样式
        bottomLine.backgroundColor = data.config.separatorColor
        NSLayoutConstraint.deactivate(bottomLine.constraints)
        NSLayoutConstraint.activate([
            bottomLine.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: data.config.separatorInset.left),
            bottomLine.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -data.config.separatorInset.right),
            bottomLine.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -data.config.separatorInset.bottom),
            bottomLine.heightAnchor.constraint(equalToConstant: data.config.separatorHeight)
        ])
        
        // 更新最小高度
        contentView.constraints.first { $0.firstAttribute == .height }?.constant = data.config.actionMinHeight
    }
}

class MGCancelActionCell: UITableViewCell {
    // MARK: - UI Components
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let topLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.96, alpha: 1.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 4
        stack.alignment = .center
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setupUI() {
        contentView.backgroundColor = .white
        
        // 添加视图
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subtitleLabel)
        contentView.addSubview(topLine)
        contentView.addSubview(stackView)
        
        // 设置约束
        NSLayoutConstraint.activate([
            // 顶部线约束
            topLine.topAnchor.constraint(equalTo: contentView.topAnchor),
            topLine.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            topLine.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            topLine.heightAnchor.constraint(equalToConstant: 5),
            
            // StackView 约束
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: topLine.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(greaterThanOrEqualTo: contentView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            // 确保最小高度
            contentView.heightAnchor.constraint(greaterThanOrEqualToConstant: 60)
        ])
    }
    
    // MARK: - Configuration
    func config(_ data: MGAction) {
        titleLabel.text = data.title
        subtitleLabel.text = data.subTitle
        
        // 应用自定义样式
        titleLabel.textColor = data.config.titleColor
        titleLabel.font = data.config.titleFont
        subtitleLabel.textColor = data.config.subtitleColor
        subtitleLabel.font = data.config.subtitleFont
        stackView.spacing = data.config.spacing
        contentView.backgroundColor = data.config.backgroundColor
        
        // 更新顶部线样式
        topLine.backgroundColor = data.config.cancelSeparatorColor
        NSLayoutConstraint.deactivate(topLine.constraints)
        NSLayoutConstraint.activate([
            topLine.topAnchor.constraint(equalTo: contentView.topAnchor),
            topLine.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            topLine.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            topLine.heightAnchor.constraint(equalToConstant: data.config.cancelSeparatorHeight)
        ])
        
        // 更新最小高度
        contentView.constraints.first { $0.firstAttribute == .height }?.constant = data.config.actionMinHeight
    }
}

public protocol MGTitleViewType: UIView {
    var viewController: FloatingBottomSheet? { set get }
}

public class MGTitleView: UIView, MGTitleViewType {
    public weak var viewController: (any FloatingBottomSheet)?
}
