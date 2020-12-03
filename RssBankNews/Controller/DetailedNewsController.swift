//
//  DetailedNewsController.swift
//  RssBankNews
//
//  Created by Nick Chekmazov on 02.12.2020.
//

import UIKit

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
        titleLable.text = "Президент поручил проработать вопрос о возможности не снижать пенсию для работающих инвалидов"
        dateLabel.text =  "3 Dec 2020, 18:26"
        descriptionLabel.text = "Президент РФ Владимир Путин в четверг в ходе встречи с представителями общественных организаций инвалидов поручил вице-премьеру Татьяне Голиковой проработать возможность не снижать пенсию для работающих людей с инвалидностью, передает ТАСС.На встрече был поднят вопрос о том, что у многих инвалидов пенсия больше зарплаты и когда люди с ограниченными возможностями по здоровью после выхода на пенсию продолжают работать, их финансовые потери могут составлять до 30% от дохода, что является мощным стимулом для ухода с работы.«Татьяна Алексеевна, я вас прошу продумать вопросы, связанные с работающими инвалидами, финансовую составляющую. Для людей с ограничениями по здоровью, конечно, вполне обоснованно делать определенные исключения. Надо продумать это», — сказал Путин, обращаясь к вице-премьеру.По данным Голиковой, в России 3,4 млн инвалидов находятся в трудоспособном возрасте. За девять месяцев текущего года из их числа работало 27,5% (свыше 900 тыс. человек). По ее оценкам, необходимый объем расходов для решения этой проблемы на 2021 год составляет 29 млрд рублей, на 2022 год — 36 млрд.«Мы проблему неоднократно рассматривали, понятно, что есть определенные финансовые ограничения у Минфина. Дадите поручение, еще раз этот вопрос проработаем», — сказала вице-премьер.«Да, надо вернуться к этому, потому что это, честно говоря, не такие уж большие деньги для бюджета по большому счету. Но надо включать людей в трудовую деятельность. Здесь нарастающим итогом больше будет позитива, чем расходов федерального бюджета. Надо подумать над этим», — поручил президент."
        descriptionLabel.font = .systemFont(ofSize: 18)
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
            titleLable.widthAnchor.constraint(equalTo: view.widthAnchor),
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
