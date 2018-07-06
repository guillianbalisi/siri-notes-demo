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
    
    func createTasks(fromTitles taskTitles: [String]) -> [INTask] {
        var tasks: [INTask] = []
        tasks = taskTitles.map { taskTitle -> INTask in
            let task = INTask(title: INSpeakableString(spokenPhrase: taskTitle),
                              status: .notCompleted,
                              taskType: .completable,
                              spatialEventTrigger: nil,
                              temporalEventTrigger: nil,
                              createdDateComponents: nil,
                              modifiedDateComponents: nil,
                              identifier: nil)
            return task
        }
        return tasks
    }
      
}

extension IntentHandler : INCreateTaskListIntentHandling {
    
    func resolveTitle(for intent: INCreateTaskListIntent, with completion: @escaping (INSpeakableStringResolutionResult) -> Void) {
        let result: INSpeakableStringResolutionResult
        
        let months = DateFormatter().monthSymbols ?? []
        
        if let title = intent.title, !title.spokenPhrase.isEmpty {
            let titleContainsMonth: Bool
            
            if let monthComponent = title.spokenPhrase.components(separatedBy: " ").first {
                titleContainsMonth = months.contains(monthComponent)
            } else {
                titleContainsMonth = false
            }
            
            if titleContainsMonth {
                result = INSpeakableStringResolutionResult.success(with: title)
            } else {
                result = INSpeakableStringResolutionResult.needsValue()
            }
        } else {
            result = INSpeakableStringResolutionResult.needsValue()
        }
        
        completion(result)
    }
    
    public func handle(intent: INCreateTaskListIntent,
                       completion: @escaping (INCreateTaskListIntentResponse) -> Swift.Void) {
        
        guard let title = intent.title else {
            completion(INCreateTaskListIntentResponse(code: .failure, userActivity: nil))
            return
        }
        
        NotesManager.sharedInstance.createList(name: title.spokenPhrase)
        
        var tasks: [INTask] = []
        if let taskTitles = intent.taskTitles {
            let taskTitlesStrings = taskTitles.map {
                taskTitle -> String in
                return taskTitle.spokenPhrase
            }
            tasks = createTasks(fromTitles: taskTitlesStrings)
            NotesManager.sharedInstance.add(tasks: taskTitlesStrings, toList: title.spokenPhrase)
        }
        
        let response = INCreateTaskListIntentResponse(code: .success, userActivity: nil)
        response.createdTaskList = INTaskList(title: title,
                                              tasks: tasks,
                                              groupName: nil,
                                              createdDateComponents: nil,
                                              modifiedDateComponents: nil,
                                              identifier: nil)
        completion(response)
    }
    
}

extension IntentHandler : INAddTasksIntentHandling {
    
    public func handle(intent: INAddTasksIntent,
                       completion: @escaping (INAddTasksIntentResponse) -> Swift.Void) {
        
        let taskList = intent.targetTaskList
        
        guard let title = taskList?.title else {
            completion(INAddTasksIntentResponse(code: .failure, userActivity: nil))
            return
        }
        
        var tasks: [INTask] = []
        if let taskTitles = intent.taskTitles {
            let taskTitlesStrings = taskTitles.map {
                taskTitle -> String in
                return taskTitle.spokenPhrase
            }
            tasks = createTasks(fromTitles: taskTitlesStrings)
            NotesManager.sharedInstance.add(tasks: taskTitlesStrings, toList: title.spokenPhrase)
        }
        
        let response = INAddTasksIntentResponse(code: .success, userActivity: nil)
        response.modifiedTaskList = intent.targetTaskList
        response.addedTasks = tasks
        completion(response)
    }
    
}

extension IntentHandler : INSetTaskAttributeIntentHandling {
    
    public func handle(intent: INSetTaskAttributeIntent,
                       completion: @escaping (INSetTaskAttributeIntentResponse) -> Swift.Void) {
        
        guard let title = intent.targetTask?.title else {
            completion(INSetTaskAttributeIntentResponse(code: .failure, userActivity: nil))
            return
        }
        
        let status = intent.status
        
        if status == .completed {
            NotesManager.sharedInstance.finish(task: title.spokenPhrase)
        }
        let response = INSetTaskAttributeIntentResponse(code: .success, userActivity: nil)
        response.modifiedTask = intent.targetTask
        completion(response)
    }
    
}
