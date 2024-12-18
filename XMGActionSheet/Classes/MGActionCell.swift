import FloatingBottomSheet

class MGActionCell: UITableViewCell {
    lazy var titleLab: UILabel = {
        let view = UILabel()
        view.textAlignment = .center
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var subtitleLab: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        view.numberOfLines = 0
        return view
    }()
    
    lazy var bottomLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9098039216, green: 0.9098039216, blue: 0.9098039216, alpha: 1)
        return view
    }()
    
    lazy var contentStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(titleLab)
        stack.addArrangedSubview(subtitleLab)
        stack.axis = .vertical
        stack.spacing = 4
        stack.alignment = .center
        stack.distribution = .fill
        return stack
    }()
    
    lazy var contentHStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(contentStack)
        stack.axis = .horizontal
        stack.spacing = 0
        stack.alignment = .center
        stack.distribution = .fill
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        contentView.backgroundColor = .white
        contentView.addSubview(contentHStack)
        contentView.addSubview(bottomLine)
        
        NSLayoutConstraint.activate([
            contentHStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            contentHStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            contentHStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            contentHStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            contentHStack.heightAnchor.constraint(greaterThanOrEqualToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            bottomLine.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            bottomLine.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            bottomLine.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            bottomLine.heightAnchor.constraint(equalToConstant: Ces.px1)
        ])
    }
    
    func config(_ data: MGAction) {
        contentView.backgroundColor = data.config.backgroundColor
        /// 标题配置
        titleLab.text = data.title
        titleLab.textColor = data.config.titleColor
        titleLab.font = data.config.titleFont
        
        /// 小标题配置
        subtitleLab.text = data.subTitle
        subtitleLab.textColor = data.config.subtitleColor
        subtitleLab.font = data.config.subtitleFont
        
        contentStack.spacing = data.config.spacing
        
        /// 分割线配置
        bottomLine.backgroundColor = data.config.separatorColor
        NSLayoutConstraint.deactivate(bottomLine.constraints)
        NSLayoutConstraint.activate([
            bottomLine.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: data.config.separatorInset.left),
            bottomLine.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -data.config.separatorInset.right),
            bottomLine.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -data.config.separatorInset.bottom),
            bottomLine.heightAnchor.constraint(equalToConstant: data.config.separatorHeight)
        ])
        
        /// 配置高度
        NSLayoutConstraint.deactivate(contentHStack.constraints)
        NSLayoutConstraint.activate([
            contentHStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            contentHStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            contentHStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            contentHStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            contentHStack.heightAnchor.constraint(greaterThanOrEqualToConstant: data.config.actionMinHeight - 20)
        ])
    }
}

class MGCancelActionCell: UITableViewCell {
    lazy var titleLab: UILabel = {
        let view = UILabel()
        view.textAlignment = .center
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var subtitleLab: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        view.numberOfLines = 0
        return view
    }()
    
    lazy var topLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9529411765, blue: 0.9647058824, alpha: 1)
        return view
    }()
    
    lazy var contentStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(titleLab)
        stack.addArrangedSubview(subtitleLab)
        stack.axis = .vertical
        stack.spacing = 4
        stack.alignment = .center
        stack.distribution = .fill
        return stack
    }()
    
    lazy var contentHStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(contentStack)
        stack.axis = .horizontal
        stack.spacing = 0
        stack.alignment = .center
        stack.distribution = .fill
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        contentView.addSubview(contentHStack)
        contentView.addSubview(topLine)
        
        NSLayoutConstraint.activate([
            topLine.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            topLine.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -0),
            topLine.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -0.5),
            topLine.heightAnchor.constraint(equalToConstant: 5)
        ])
        
        NSLayoutConstraint.activate([
            contentHStack.topAnchor.constraint(equalTo: topLine.bottomAnchor, constant: 10),
            contentHStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            contentHStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            contentHStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            contentHStack.heightAnchor.constraint(greaterThanOrEqualToConstant: 50)
        ])
        
    }
    
    func config(_ data: MGAction) {
        contentView.backgroundColor = data.config.backgroundColor
        
        titleLab.text = data.title
        titleLab.textColor = data.config.titleColor
        titleLab.font = data.config.titleFont
        
        subtitleLab.text = data.subTitle
        subtitleLab.textColor = data.config.subtitleColor
        subtitleLab.font = data.config.subtitleFont
        
        contentStack.spacing = data.config.spacing
        
        /// 分割线配置
        topLine.backgroundColor = data.config.cancelSeparatorColor
        topLine.setContentHuggingPriority(.required, for: .vertical)
        topLine.setContentCompressionResistancePriority(.required, for: .vertical)
        NSLayoutConstraint.deactivate(topLine.constraints)
        NSLayoutConstraint.activate([
            topLine.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            topLine.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -0),
            topLine.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -0.5),
            topLine.heightAnchor.constraint(equalToConstant: data.config.cancelSeparatorHeight)
        ])
        
        /// 配置高度
        NSLayoutConstraint.deactivate(contentHStack.constraints)
        NSLayoutConstraint.activate([
            contentHStack.topAnchor.constraint(equalTo: topLine.bottomAnchor, constant: 10),
            contentHStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            contentHStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            contentHStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            contentHStack.heightAnchor.constraint(greaterThanOrEqualToConstant: data.config.actionMinHeight - 20)
        ])
    }
}


public protocol MGTitleViewType: UIView {
    var viewController: FloatingBottomSheet? { set get }
}

public class MGTitleView: UIView, MGTitleViewType {
    public weak var viewController: (any FloatingBottomSheet)?
}
