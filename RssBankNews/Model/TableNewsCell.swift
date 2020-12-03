//
//  TableNewsCell.swift
//  RssBankNews
//
//  Created by Nick Chekmazov on 02.12.2020.
//

import UIKit

final class TableNewsCell: UITableViewCell {
    
    static var identifier = "WeatherTableViewCell"
    let titleLable = UILabel()
    let dateLabel = UILabel()
    let stateLabel = UILabel()
    
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
        
        titleLable.numberOfLines = 0
        titleLable.textAlignment = .center
        stateLabel.text = "Просмотрено"
        stateLabel.textColor = .darkGray
        titleLable.font = .boldSystemFont(ofSize: 20)
    }
    
    private func addSubViews() {
        [titleLable, dateLabel, stateLabel].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func addConstraints() {
        
        [titleLable, dateLabel, stateLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            titleLable.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            titleLable.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            titleLable.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),

            stateLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            stateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
        ])
    }
    
    func update(post: Post) {
        titleLable.text = post.title
        dateLabel.text = post.pubDate
    }

}
