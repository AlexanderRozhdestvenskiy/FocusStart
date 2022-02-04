//
//  PageTwoViewController.swift
//  FocusStart
//
//  Created by Alexander Rozhdestvenskiy on 28.01.2022.
//

import UIKit

class PageTwoViewController: UIViewController {
    
    let back = UIView()
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        style()
        layout()
    }
    
    private func style() {
        view.backgroundColor = .systemBackground
        
        back.translatesAutoresizingMaskIntoConstraints = false
        back.backgroundColor = .systemTeal
        back.layer.cornerRadius = 16
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Неважно, хотите ли вы повысить свою продуктивность, прекратить переживать, что о чем-то забыли, или просто освободить свою голову и немного отдохнуть - с приложением Заметки вы легко спланируете день и научитесь управлять своей жизнью."
    }
    
    private func layout() {
        view.addSubview(back)
        view.addSubview(label)
        
        back.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 48).isActive = true
        back.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        back.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
        back.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32).isActive = true
        
        label.leadingAnchor.constraint(equalTo: back.leadingAnchor, constant: 16).isActive = true
        label.trailingAnchor.constraint(equalTo: back.trailingAnchor, constant: -16).isActive = true
        label.topAnchor.constraint(equalTo: back.topAnchor, constant: 16).isActive = true
        label.bottomAnchor.constraint(equalTo: back.bottomAnchor, constant: -16).isActive = true
    }
}
