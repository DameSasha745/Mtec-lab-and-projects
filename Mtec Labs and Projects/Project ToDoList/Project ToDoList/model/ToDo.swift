//
//  ToDo.swift
//  Project ToDoList
//
//  Created by Sasha Cummings on 3/22/25.
//

import Foundation

struct ToDo : Equatable, Codable {
    let id: UUID
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    
    init(title: String, isComplete: Bool, dueDate: Date, notes: String?) {
        self.id = UUID()
        self.title = title
        self.isComplete = isComplete
        self.dueDate = dueDate
        self.notes = notes
    }
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentsDirectory.appendingPathComponent("toDos").appendingPathExtension("plist")
    
    static func == (lhs: ToDo, rhs: ToDo) -> Bool {
        return lhs.id == rhs.id
    }
    static func loadToDOs() -> [ToDo]? {
        guard let codedToDos = try? Data(contentsOf: archiveURL) else { return nil }
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode(Array<ToDo>.self, from: codedToDos)
    }
    static func saveToDos(_ todos: [ToDo]) {
        let propertyListEncoder = PropertyListEncoder()
        let codedToDos = try? propertyListEncoder.encode(todos)
        try? codedToDos?.write(to: archiveURL, options: .noFileProtection)
    }
    static func loadSampleToDos() -> [ToDo] {
        let toDo1 = ToDo(title: "To-Do one", isComplete: false, dueDate: Date(), notes: "Notes 1")
        let toDo2 = ToDo(title: "To-Do two", isComplete: false, dueDate: Date(), notes: "Notes 2")
        let toDo3 = ToDo(title: "To-Do three", isComplete: false, dueDate: Date(), notes: "Notes 3")
        
        return [toDo1, toDo2, toDo3]
    }
}
