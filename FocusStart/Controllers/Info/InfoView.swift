//
//  InfoView.swift
//  FocusStart
//
//  Created by Alexander Rozhdestvenskiy on 01.02.2022.
//

import UIKit

class InfoView: UIView {
    
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
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Информация о приложении. Создайте список дел."
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.numberOfLines = 0
        
        layer.cornerRadius = 8
        clipsToBounds = true
    }
    
    private func layout() {
        addSubview(label)
        
        label.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
    }
}
