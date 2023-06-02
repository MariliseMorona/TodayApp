//
//  NoteListView.swift
//  TodayApp
//
//  Created by Marilise Morona on 01/06/23.
//

import UIKit

class NoteListView : UIView {
    
    lazy var listNotes : UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureTableProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        listNotes.delegate = delegate
        listNotes.dataSource = dataSource
    }
    
    func setUp() {
        addSubview(listNotes)
        constrains()
    }
    func constrains() {
        NSLayoutConstraint.activate([
            listNotes.topAnchor.constraint(equalTo: topAnchor),
            listNotes.trailingAnchor.constraint(equalTo: trailingAnchor),
            listNotes.bottomAnchor.constraint(equalTo: bottomAnchor),
            listNotes.leadingAnchor.constraint(equalTo: leadingAnchor),
            
        ])
    }
}
