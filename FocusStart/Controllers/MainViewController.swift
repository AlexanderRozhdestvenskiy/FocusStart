//
//  ViewController.swift
//  FocusStart
//
//  Created by Alexander Rozhdestvenskiy on 29.01.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    var tasks: [Task] = []
    
    let contex = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let table = UITableView()
    let label = UILabel()
    let infoButton = UIBarButtonItem()
    let editButton = UIBarButtonItem()
    let addButton = UIBarButtonItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        style()
        layout()
    }
    
    private func setup() {
        table.delegate = self
        table.dataSource = self
        
        table.register(MainViewCell.self, forCellReuseIdentifier: MainViewCell.reuseID)
        table.rowHeight = MainViewCell.rowHeight
        
        getAllTasks()
    }
    
    private func style() {
        view.backgroundColor = .systemBackground
        title = "Заметки"
        
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .systemBackground
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Список пуст"
        label.font = UIFont.preferredFont(forTextStyle: .body)
        
        infoButton.style = .plain
        infoButton.image = UIImage(systemName: "info.circle")
        infoButton.target = self
        infoButton.action = #selector(tappedInfo)
        
        editButton.style = .plain
        editButton.title = "Изменить"
        editButton.target = self
        editButton.action = #selector(tappedEdit)
        
        addButton.style = .plain
        addButton.image = UIImage(systemName: "plus.circle")
        addButton.target = self
        addButton.action = #selector(tappedAdd)
        
        navigationItem.rightBarButtonItems = [addButton, editButton]
        navigationItem.leftBarButtonItem = infoButton
    }
    
    private func layout() {
        view.addSubview(table)
        view.addSubview(label)
        
        table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        table.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        table.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

extension MainViewController {
    @objc private func tappedAdd(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Новая заметка", message: "Введите новую заметку", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Добавить", style: .default, handler: { [weak self] _ in
            guard let field = alert.textFields?.first, let text = field.text, !text.isEmpty else {
                return
            }
            
            self?.createTasks(title: text)
        }))
        
        present(alert, animated: true)
    }
    
    @objc private func tappedEdit(_ sender: UIBarButtonItem) {
        table.setEditing(!table.isEditing, animated: true)
        editButton.title = table.isEditing ? "Готово" : "Изменить"
        infoButton.isEnabled = table.isEditing ? false : true
        addButton.isEnabled = table.isEditing ? false : true
    }
    
    @objc private func tappedInfo(_ sender: UIBarButtonItem) {
        navigationController?.pushViewController(InfoViewController(), animated: true)
    }
}
