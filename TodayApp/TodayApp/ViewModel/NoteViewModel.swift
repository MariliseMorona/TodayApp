//
//  NoteViewModel.swift
//  TodayApp
//
//  Created by Marilise Morona on 02/06/23.
//

import UIKit

final class NoteViewModel {
    var notes = Reminder.listReminders
    
    func countNotes()-> Int {
        return notes.count
    }
    
    func note(_ item: Int) -> Reminder {
        return notes[item]
    }
    
    func changeStateOfTheNote(note: Reminder, indexPath: IndexPath, table: UITableView){
        note.concluded == true ? (note.concluded = false) : (note.concluded = true)
        table.reloadRows(at: [indexPath], with: .fade)
    }
    
    func reloadData(table: UITableView) {
        table.reloadData()
    }
}
