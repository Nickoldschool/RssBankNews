//
//  TableNewsCell.swift
//  RssBankNews
//
//  Created by Nick Chekmazov on 02.12.2020.
//

import UIKit

final class TableNewsCell: UITableViewCell {
    
    static let identifier = "TableNewsCell"

    private lazy var titleLable: UILabel = {
        let label = UILabel(font: .boldSystemFont(ofSize: Constants.titleFont), textColor: .black)
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel(font: .systemFont(ofSize: Constants.defaultFont), textColor: .black)
        return label
    }()
    
    private lazy var stateLabel: UILabel = {
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
            addSubview($0)
        }
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            titleLable.topAnchor.constraint(equalTo: topAnchor, constant: Constants.topCellAnchor),
            titleLable.widthAnchor.constraint(equalToConstant: self.bounds.width - 20),
            titleLable.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            dateLabel.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: Constants.titleBottomAnchor),
            dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.dateLabelBottom),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.leadingAnchor),
            
            stateLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            stateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.trailingAnchor),
        ])
    }
    
    func update(post: Post, read: Bool) {
        titleLable.text = post.title
        dateLabel.text = post.pubDate
        isRead(read: read)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        stateLabel.text = ""
    }

    func isRead(read: Bool) {
        if read == true {
            stateLabel.text = "Просмотрено"
        } else {
            stateLabel.text = ""
        }
    }
}
