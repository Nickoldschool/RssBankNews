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
    
    private lazy var  titleLabel: UILabel = {
        let label = UILabel(font: .boldSystemFont(ofSize: Constants.titleFont), textColor: .black)
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel(font: .systemFont(ofSize: Constants.defaultFont), textColor: .black)
        return label
    }()
    
    private let descriptionLabel: UITextView = {
        let textView = UITextView(font:.systemFont(ofSize: Constants.textViewFont))
        return textView
    }()
    
    //weak var tableNewsController: TableNewsController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        //moreInfo()
        addSubViews()
        addConstraints()
    }


    private func configure() {
        view.backgroundColor = .white
    }
    
//    private func moreInfo() {
//        tableNewsController.completion = { [unowned self] moreInfo in
//            self.titleLabel.text = moreInfo.title
//            self.dateLabel.text = moreInfo.pubDate
//            self.descriptionLabel.text = moreInfo.description
//        }
//    }
    
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

extension DetailedNewsController: PassData {
    
    func loadNews(post: Post) {
        titleLabel.text = post.title
        dateLabel.text = post.pubDate
        descriptionLabel.text = post.description
    }
}

