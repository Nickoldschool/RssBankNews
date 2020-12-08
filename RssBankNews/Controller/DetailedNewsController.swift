//
//  DetailedNewsController.swift
//  RssBankNews
//
//  Created by Nick Chekmazov on 02.12.2020.
//

import UIKit

protocol PassData: AnyObject {
    
    func loadNews(post: Post)

}

final class DetailedNewsController: UIViewController {
    
    //MARK: - Properties
    
    lazy var  titleLable: UILabel = {
        let label = UILabel(font: .boldSystemFont(ofSize: 20), textColor: .black)
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel(font: .systemFont(ofSize: 16), textColor: .black)
        return label
    }()
    
    let descriptionLabel: UITextView = {
        let textView = UITextView(font:.systemFont(ofSize: 18))
        return textView
    }()

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
        [titleLable, dateLabel, descriptionLabel].forEach {
            view.addSubview($0)
        }
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            titleLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLable.widthAnchor.constraint(equalToConstant: view.bounds.width - 15),
            titleLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            dateLabel.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 15),
            dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 15),
            descriptionLabel.widthAnchor.constraint(equalToConstant: view.bounds.width - 30),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension DetailedNewsController: PassData {
    
    func loadNews(post: Post) {
        titleLable.text = post.title
        dateLabel.text = post.pubDate
        descriptionLabel.text = post.description
    }
}

