//
//  DiaryDataSourceDelegate.swift
//  ListsSiriKit
//
//  Created by Guillian Balisi on 2018-07-09.
//  Copyright © 2018 Martin Mitrevski. All rights reserved.
//

import Foundation
import UIKit

class DiaryDataSourceDelegate: NSObject {
    var notes: [Note] {
        return NotesManager.shared.notes
    }
}

extension DiaryDataSourceDelegate: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = notes[indexPath.row].title
        cell.detailTextLabel?.text = notes[indexPath.row].date
        return cell
    }
}

extension DiaryDataSourceDelegate: UITableViewDelegate {
    
}
