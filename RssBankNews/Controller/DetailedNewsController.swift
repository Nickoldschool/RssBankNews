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
        
        titleLable.text = "Исследование: россияне отказались от массовых покупок в период «черной пятницы — 2020»"
        dateLabel.text =  "3 Dec 2020, 11:13"
        descriptionLabel.text = "Российские клиенты интернет-магазинов в этом году снизили свои расходы на покупки в период международной распродажи «Черная пятница — 2020» в сравнении с результатами прошлогодней распродажи. Рост показали только покупки онлайн-игр. Такие результаты представила QIWI, проанализировав данные эквайринговых платежей в пользу сотен интернет-магазинов и провайдеров, подключенных к платежным каналам компании.Так, в пятницу 27 ноября оборот магазинов снизился на 12%, а количество трансакций — на 36% в сравнении с «черной пятницей» 29 ноября 2019 года. В то же время неделя распродаж 23—29 ноября показала снижение оборота на 17% и количества трансакций — на 40% в сравнении с аналогичной неделей распродаж прошлого года. Средняя сумма онлайн-покупок в этом году составила 741 рубль.В связи с принятыми в крупных городах карантинными мерами сильное снижение результатов показали категории билетов в кино и на развлекательные мероприятия. Во время отчетной недели оборот и количество покупок билетов в кино снизились на 69% в сравнении с аналогичной неделей прошлого года. Средний чек составил 878 рублей. Развлекательные мероприятия показали снижение оборота на 60% и количества трансакций на 44% в сравнении с аналогичным периодом прошлого года. Средний чек для этой категории составил 998 рублей.«Большинство компаний в этом году запустили распродажи «черной пятницы» за одну-две недели до официального дня, но, к сожалению, это не позволило привлечь больше клиентов. В этом году покупательная способность россиян снизилась в связи с пандемией, поэтому многие экономно подошли к покупкам в период распродажи», — отмечает директор по развитию интернет-эквайринга QIWI Ришат Аббазов.В то же время рост спроса показали онлайн-игры: за неделю оборот и количество трансакций выросли на 51% и 32% в сравнении с аналогичной неделей прошлого года. Средний чек покупок российских геймеров составил 370 рублей.Регионами с самыми высокими расходами за неделю стали Москва и Московская область, Санкт-Петербург, Краснодарский край и Свердловская область."
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
            titleLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            titleLable.widthAnchor.constraint(equalTo: view.widthAnchor),
            titleLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            dateLabel.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 15),
            dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            descriptionLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 15),
            descriptionLabel.widthAnchor.constraint(equalTo: view.widthAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }
}
