//
//  Main+Data.swift
//  FocusStart
//
//  Created by Alexander Rozhdestvenskiy on 03.02.2022.
//

import UIKit

extension MainViewController {
    
    func getAllTasks() {
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
    
    func createTasks(title: String) {
        let newTask = Task(context: contex)
        newTask.title = title
        newTask.isActive = false
        
        do {
            try contex.save()
            getAllTasks()
        } catch {
            // error
        }
    }
    
    func deleteTasks(task: Task) {
        contex.delete(task)
        
        do {
            try contex.save()
            getAllTasks()
        } catch {
            // error
        }
    }
    
    func updateTasks(task: Task, newTitle: String) {
        task.title = newTitle
        
        do {
            try contex.save()
            getAllTasks()
        } catch {
            // error
        }
    }
}
