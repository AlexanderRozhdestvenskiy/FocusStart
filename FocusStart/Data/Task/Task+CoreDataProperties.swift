//
//  Task+CoreDataProperties.swift
//  FocusStart
//
//  Created by Alexander Rozhdestvenskiy on 02.02.2022.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var title: String?
    @NSManaged public var date: Date?

}

extension Task: Identifiable {
    
}
