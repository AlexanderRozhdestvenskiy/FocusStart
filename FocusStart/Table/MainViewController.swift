//
//  ViewController.swift
//  FocusStart
//
//  Created by Alexander Rozhdestvenskiy on 29.01.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private var tasks: [Task] = []
    
    let contex = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let table = UITableView()
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        style()
        layout()
    }
    
    private func setup() {
        table.delegate = self
        table.dataSource = self
        
        table.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        getAllTasks()
    }
    
    private func style() {
        view.backgroundColor = .systemBackground
        title = "Заметки"
        
        table.translatesAutoresizingMaskIntoConstraints = false
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Список пуст"
        label.font = UIFont.preferredFont(forTextStyle: .body)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.circle"), style: .plain, target: self, action: #selector(tappedAdd))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "info.circle"), style: .plain, target: self, action: #selector(tappedInfo))
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

    // MARK: - Data Source

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = tasks[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = task.title
        return cell
    }
}

    // MARK: - Delegate

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let task = tasks[indexPath.row]
        
        let sheet = UIAlertController(title: "Изменить", message: nil, preferredStyle: .actionSheet)
        
        sheet.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        sheet.addAction(UIAlertAction(title: "Изменить", style: .default, handler: { _ in
            let alert = UIAlertController(title: "Изменить заметку", message: "Измените свою заметку", preferredStyle: .alert)
            
            alert.addTextField(configurationHandler: nil)
            alert.textFields?.first?.text = task.title
            alert.addAction(UIAlertAction(title: "Сохранить", style: .cancel, handler: { [weak self] _ in
                guard let field = alert.textFields?.first, let newTitle = field.text, !newTitle.isEmpty else {
                    return
                }
                
                self?.updateTasks(task: task, newTitle: newTitle)
            }))
            
            self.present(alert, animated: true)
        }))
        sheet.addAction(UIAlertAction(title: "Удалить", style: .destructive, handler: { [weak self] _ in
            self?.deleteTasks(task: task)
        }))
            
        
        present(sheet, animated: true)
    }
}

    // MARK: - Action

extension MainViewController {
    @objc private func tappedAdd(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Новая заметка", message: "Введите новую заметку", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Отмена", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Добавить", style: .default, handler: { [weak self] _ in
            guard let field = alert.textFields?.first, let text = field.text, !text.isEmpty else {
                return
            }
            
            self?.createTasks(title: text)
        }))
        
        present(alert, animated: true)
    }
    
    @objc private func tappedInfo(_ sender: UIBarButtonItem) {
        navigationController?.pushViewController(InfoViewController(), animated: true)
    }
}

    // MARK: - Core Data

extension MainViewController {
    
    private func getAllTasks() {
        do {
            tasks = try contex.fetch(Task.fetchRequest())
            
            DispatchQueue.main.async {
                self.table.reloadData()
            }
            
            if tasks.isEmpty {
                label.isHidden = false
            } else {
                label.isHidden = true
            }
        } catch {
            // error
        }
        
    }
    
    private func createTasks(title: String) {
        let newTask = Task(context: contex)
        newTask.title = title
        newTask.date = Date()
        
        do {
            try contex.save()
            getAllTasks()
        } catch {
            
        }
    }
    
    private func deleteTasks(task: Task) {
        contex.delete(task)
        
        do {
            try contex.save()
            getAllTasks()
        } catch {
            
        }
    }
    
    private func updateTasks(task: Task, newTitle: String) {
        task.title = newTitle
        
        do {
            try contex.save()
            getAllTasks()
        } catch {
            
        }
    }
}
