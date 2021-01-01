//
//  DetailedNewsController.swift
//  RssBankNews
//
//  Created by Nick Chekmazov on 02.12.2020.
//

import UIKit

final class DetailedNewsController: UIViewController {
    
    //MARK: - Properties
    
    lazy var  titleLabel: UILabel = {
        let label = UILabel(font: .boldSystemFont(ofSize: Constants.titleFont), textColor: .black)
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel(font: .systemFont(ofSize: Constants.defaultFont), textColor: .black)
        return label
    }()
    
    let descriptionLabel: UITextView = {
        let textView = UITextView(font:.systemFont(ofSize: Constants.textViewFont))
        return textView
    }()
    
    
    //MARK: - Callback
    
    var completion: ((DetailedNewsController) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        addSubViews()
        addConstraints()
    }


    private func configure() {
        view.backgroundColor = .white
    }
    
    private func addSubViews() {
        [titleLabel, dateLabel, descriptionLabel].forEach {
            view.addSubview($0)
        }
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.topDetailVCAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: view.bounds.width - Constants.titleWidthAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.diffAncor),
            dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: Constants.diffAncor),
            descriptionLabel.widthAnchor.constraint(equalToConstant: view.bounds.width - Constants.descriptionWidthAnchor),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}


