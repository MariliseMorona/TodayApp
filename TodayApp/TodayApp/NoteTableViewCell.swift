//
//  NoteTableViewCell.swift
//  TodayApp
//
//  Created by Marilise Morona on 01/06/23.
//

import UIKit

class NoteTableViewCell : UITableViewCell {
    
    lazy var noteView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var noteTitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var noteData: UILabel = {
        let data = UILabel()
        data.translatesAutoresizingMaskIntoConstraints = false
        return data
    }()
    
    lazy var noteDescription: UILabel = {
        let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    
    lazy var noteBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .orange
        return btn
    }()
    
    init() {
        super.init(style: .default, reuseIdentifier: nil)
        setUp()
        selectionStyle = .none
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp() {
        addSubview(noteView)
        noteView.addSubview(noteBtn)
        noteView.addSubview(noteTitle)
        noteView.addSubview(noteData)
        noteView.addSubview(noteDescription)
        constrains()
    }
    
    func constrains() {
        NSLayoutConstraint.activate([
            noteView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            noteView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 15),
            noteView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 5),
            noteView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            noteBtn.topAnchor.constraint(equalTo: noteView.topAnchor),
            noteBtn.centerYAnchor.constraint(equalTo: noteView.centerYAnchor),
            noteBtn.heightAnchor.constraint(equalToConstant: 15),
            noteBtn.widthAnchor.constraint(equalToConstant: 15),
            
            noteTitle.topAnchor.constraint(equalTo: noteView.topAnchor),
            noteTitle.leadingAnchor.constraint(equalTo: noteBtn.trailingAnchor, constant: 10),
            noteTitle.trailingAnchor.constraint(equalTo: noteView.trailingAnchor),
            
            noteData.topAnchor.constraint(equalTo: noteTitle.bottomAnchor),
            noteData.leadingAnchor.constraint(equalTo: noteTitle.leadingAnchor),
            noteData.trailingAnchor.constraint(equalTo: noteTitle.trailingAnchor),
            
            noteDescription.topAnchor.constraint(equalTo: noteData.bottomAnchor),
            noteDescription.leadingAnchor.constraint(equalTo: noteData.leadingAnchor),
            noteDescription.trailingAnchor.constraint(equalTo: noteData.trailingAnchor),
        ])
    }
}
