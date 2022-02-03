//
//  MainViewCell.swift
//  FocusStart
//
//  Created by Alexander Rozhdestvenskiy on 02.02.2022.
//

import UIKit

class MainViewCell: UITableViewCell {
    
    let task: Task? = nil
    
    private var colorChange: Bool = false
    
    let buttonActive = UIButton(type: .system)
    let labelTask = UILabel()
    
    static let reuseID = "MainViewCell"
    static let rowHeight: CGFloat = 64
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        buttonActive.translatesAutoresizingMaskIntoConstraints = false
        buttonActive.layer.cornerRadius = 16
        buttonActive.layer.borderWidth = 2
        buttonActive.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        buttonActive.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        labelTask.translatesAutoresizingMaskIntoConstraints = false
        labelTask.text = "Hello"
        labelTask.numberOfLines = 0
        labelTask.font = UIFont.preferredFont(forTextStyle: .body)
        
        contentView.backgroundColor = .systemBackground
    }
    
    private func layout() {
        contentView.addSubview(buttonActive)
        contentView.addSubview(labelTask)
        
        buttonActive.heightAnchor.constraint(equalToConstant: 32).isActive = true
        buttonActive.widthAnchor.constraint(equalToConstant: 32).isActive = true
        buttonActive.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        buttonActive.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 56).isActive = true
        
        labelTask.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        labelTask.leadingAnchor.constraint(equalTo: buttonActive.trailingAnchor, constant: 16).isActive = true
        labelTask.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        colorChange.toggle()
        sender.backgroundColor = colorChange ? .systemGreen : .systemBackground
        sender.layer.cornerRadius = colorChange ? 8 : 16
    }
    
}

extension MainViewCell {
    func configure(task: Task) {
        labelTask.text = task.title
    }
}
