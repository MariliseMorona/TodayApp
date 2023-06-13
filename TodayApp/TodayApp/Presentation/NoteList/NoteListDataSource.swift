//
//  NoteListDataSource.swift
//  TodayApp
//
//  Created by Marilise Morona on 02/06/23.
//

import UIKit

extension NoteListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.countNotes()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = NoteTableViewCell()
        cell.bindCell(data: viewModel.note(indexPath.row))
        viewModel.note(indexPath.row).concluded == true ? (cell.noteBtn.backgroundColor = Colors.green) : (cell.noteBtn.backgroundColor = .clear)
        cell.onClick = {
            self.viewModel.changeStateOfTheNote(note: self.viewModel.note(indexPath.row), indexPath: indexPath, table: tableView)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newVc = DetailsViewController(note: viewModel.note(indexPath.row))
        navigationController?.show(newVc, sender: true)
    }
}
