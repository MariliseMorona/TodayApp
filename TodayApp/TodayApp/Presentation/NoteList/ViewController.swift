//
//  NoteListViewController.swift
//  TodayApp
//
//  Created by Marilise Morona on 01/06/23.
//

import UIKit

class NoteListViewController: UIViewController {
    
    lazy var listView = NoteListView()
    var noteList = Reminder.listReminders

    override func viewDidLoad() {
        super.viewDidLoad()
        view = listView
        listView.backgroundColor = .orange
        listView.configureTableProtocols(delegate: self, dataSource: self)
        noteList = Reminder.listReminders
    }
    
    private func changeStateOfTheNote(note: Reminder, indexPath: IndexPath){
        note.concluded == true ? (note.concluded = false) : (note.concluded = true)
        listView.listNotes.reloadRows(at: [indexPath], with: .fade)
    }
}

extension NoteListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteList.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = NoteTableViewCell()
        cell.bindCell(data: noteList[indexPath.row])
        noteList[indexPath.row].concluded == true ? (cell.noteBtn.backgroundColor = Colors.green) : (cell.noteBtn.backgroundColor = .clear)
        cell.onClick = {
            self.changeStateOfTheNote(note: self.noteList[indexPath.row], indexPath: indexPath)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DetailsViewController(note: noteList[indexPath.row])
        navigationController?.show(controller, sender: .none)
    }
}


