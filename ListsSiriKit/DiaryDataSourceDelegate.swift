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
    
    let fakeNotes = [Note(title: "Feeling good", isManualEntry: true),
                     Note(title: "Medium tremors", isManualEntry: false),
                     Note(title: "Muscle stiffness", isManualEntry: true),
                     Note(title: "Insomnia during the night", isManualEntry: true),
                     Note(title: "Dizziness while sitting", isManualEntry: false),
                     Note(title: "Light tremors", isManualEntry: false),
                     Note(title: "Lost balance", isManualEntry: true),
                     Note(title: "Light tremors", isManualEntry: false)]
}

extension DiaryDataSourceDelegate: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fakeNotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DiaryCell") as? DiaryCell
            else { return UITableViewCell() }
        
        let note = fakeNotes[indexPath.row]
        
        cell.setCell(isFirstCell: indexPath.row == 0,
                     isLastCell: indexPath.row == fakeNotes.endIndex-1,
                     note: note)
        return cell
    }
}

extension DiaryDataSourceDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return DiaryCell.height
    }
}
