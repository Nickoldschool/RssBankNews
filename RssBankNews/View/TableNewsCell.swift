//
//  TableNewsCell.swift
//  RssBankNews
//
//  Created by Nick Chekmazov on 02.12.2020.
//

import UIKit

final class TableNewsCell: UITableViewCell {
    
    static var identifier = "TableNewsCell"
    
    var cellIndex: IndexPath?
    
    lazy var titleLable: UILabel = {
        let label = UILabel(font: .boldSystemFont(ofSize: Constants.titleFont), textColor: .black)
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel(font: .systemFont(ofSize: Constants.defaultFont), textColor: .black)
        return label
    }()
    
    lazy var stateLabel: UILabel = {
        let label = UILabel(font: .systemFont(ofSize: Constants.defaultFont), textColor: .darkGray)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
        addSubViews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .white
        accessoryType = .disclosureIndicator
    }
    
    private func addSubViews() {
        [titleLable, dateLabel, stateLabel].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            titleLable.topAnchor.constraint(equalTo: topAnchor, constant: Constants.topCellAnchor),
            titleLable.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            titleLable.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.leadingAnchor),
            
            stateLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            stateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.trailingAnchor),
        ])
    }
    
    func update(post: Post) {
        titleLable.text = post.title
        dateLabel.text = post.pubDate
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        stateLabel.text = ""
    }
    
    func state(index: IndexPath) {
        if cellIndex?.row == index.row {
            stateLabel.text = "Просмотрено"
        } else {
            stateLabel.text = ""
        }
    }
}
