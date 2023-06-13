//
//  NoteListViewController.swift
//  TodayApp
//
//  Created by Marilise Morona on 01/06/23.
//

import UIKit

class NoteListViewController: UIViewController {

    lazy var listView = NoteListView()
    var viewModel = NoteViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = listView
        listView.backgroundColor = .orange
        listView.configureTableProtocols(delegate: self, dataSource: self)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.reloadData(table: listView.listNotes)
    }

}
