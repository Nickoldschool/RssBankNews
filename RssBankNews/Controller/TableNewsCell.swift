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

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
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
        titleLable.text = "Исследование: россияне отказались от массовых покупок в период «черной пятницы — 2020»"
        dateLabel.text = " 3 Dec 2020, 11:13"
        stateLabel.text = "Просмотрено"
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
            titleLable.topAnchor.constraint(equalTo: topAnchor),
            titleLable.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            titleLable.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),

            stateLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            stateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
        ])
    }

}
