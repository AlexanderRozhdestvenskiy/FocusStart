//
//  InfoView.swift
//  FocusStart
//
//  Created by Alexander Rozhdestvenskiy on 01.02.2022.
//

import UIKit

class InfoView: UIView {
    
    let labelTitle = UILabel()
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemBackground
        
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.text = "Информация о приложении"
        labelTitle.font = UIFont.preferredFont(forTextStyle: .title3)
        labelTitle.textAlignment = .center
        labelTitle.numberOfLines = 1
        labelTitle.adjustsFontForContentSizeCategory = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Постоянно что-то планируете в уме? Попробуйте приложение Заметки, которое позволяет:\n\n• cоздавать список дел\n\n• редактировать список\n\n• отмечать выполненные дела"
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.textAlignment = .left
        label.numberOfLines = 0
        
        layer.cornerRadius = 8
        clipsToBounds = true
    }
    
    private func layout() {
        addSubview(labelTitle)
        addSubview(label)
        
        labelTitle.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        labelTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        labelTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        
        label.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 32).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
    }
}
