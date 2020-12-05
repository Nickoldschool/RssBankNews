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
    
    let titleLable = UILabel()
    let dateLabel = UILabel()
    let descriptionLabel = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        addSubViews()
        addConstraints()
    }

    private func configure() {
        
        view.backgroundColor = .white
        [titleLable, dateLabel].forEach {
            $0.numberOfLines = 0
        }
        
        titleLable.textAlignment = .center
        titleLable.font = .boldSystemFont(ofSize: 20)
        descriptionLabel.font = .systemFont(ofSize: 18)
        descriptionLabel.isEditable = false
    }
    
    private func addSubViews() {
        [titleLable, dateLabel, descriptionLabel].forEach {
            view.addSubview($0)
        }
    }
    
    private func addConstraints() {
        
        [titleLable, dateLabel, descriptionLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
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

