//
//  NotesManager.swift
//  ListsSiriKit
//
//  Created by Martin Mitrevski on 24.06.17.
//  Copyright © 2017 Martin Mitrevski. All rights reserved.
//

import Foundation

class NotesManager {
    private var savedNotes: [String] = []
    static let NotesKey = "notes"
    static let GroupId = "group.com.gbalisi.ListsSiri"
    static let shared = NotesManager()
    
    let sharedDefaults = UserDefaults(suiteName: NotesManager.GroupId)
    
    var notes: [String] {
        return savedNotes
    }
    
    init() {
        if let savedNotes = sharedDefaults?.value(forKey: NotesManager.NotesKey) as? [String] {
            self.savedNotes = savedNotes
        }
    }
    
    func createNote(_ note: String) {
        savedNotes.append(note)
        sharedDefaults?.set(savedNotes, forKey: NotesManager.NotesKey)
    }
}
