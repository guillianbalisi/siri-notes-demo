//
//  IntentHandler.swift
//  Siri
//
//  Created by Martin Mitrevski on 24.06.17.
//  Copyright © 2017 Martin Mitrevski. All rights reserved.
//

import Intents

class IntentHandler: INExtension {
    
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        return self
    }
}

extension IntentHandler: INCreateNoteIntentHandling {
    func handle(intent: INCreateNoteIntent, completion: @escaping (INCreateNoteIntentResponse) -> Void) {
        
        guard let title = intent.title, !title.spokenPhrase.isEmpty else {
            completion(INCreateNoteIntentResponse(code: .failure, userActivity: nil))
            return
        }
        
        NotesManager.shared.createNote(title: title.spokenPhrase)
        
        let response = INCreateNoteIntentResponse(code: .success, userActivity: nil)
        response.createdNote = INNote(title: title, contents: [], groupName: nil, createdDateComponents: nil, modifiedDateComponents: nil, identifier: nil)
        
        completion(response)
    }
}
