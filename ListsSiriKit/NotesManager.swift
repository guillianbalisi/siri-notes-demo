//
//  NotesManager.swift
//  ListsSiriKit
//
//  Created by Martin Mitrevski on 24.06.17.
//  Copyright © 2017 Martin Mitrevski. All rights reserved.
//

import Foundation

struct Note: Codable {
    let title: String
    let date: String
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, h:mm a"
        return formatter
    }()
    
    init(title: String) {
        self.title = title
        self.date = Note.dateFormatter.string(from: Date())
    }
}

class NotesManager {
    private var savedNotes: [Note] = []
    static let NotesKey = "notes"
    static let GroupId = "group.com.gbalisi.ListsSiri"
    static let shared = NotesManager()
    
    private let sharedContainer = Disk.Directory.sharedContainer(appGroupName: NotesManager.GroupId)

    var notes: [Note] {
        return savedNotes
    }

    init() {
        do {
            savedNotes = try Disk.retrieve(NotesManager.NotesKey, from: sharedContainer, as: [Note].self)
        } catch {
            savedNotes = []
        }
    }

    func createNote(title: String) {
        let newNote = Note(title: title)
        savedNotes.append(newNote)
        try? Disk.append(newNote, to: NotesManager.NotesKey, in: sharedContainer)
    }
}
