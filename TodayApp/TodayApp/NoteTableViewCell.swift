//
//  NoteTableViewCell.swift
//  TodayApp
//
//  Created by Marilise Morona on 01/06/23.
//

import UIKit

class NoteTableViewCell : UITableViewCell {
    
    var onClick: (() -> Void)?
    private var descriptionIsEmpty: Bool = false
    
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
    
    lazy var noteDate: UILabel = {
        let date = UILabel()
        date.translatesAutoresizingMaskIntoConstraints = false
        return date
    }()
    
    lazy var noteDescription: UILabel = {
        let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    
    lazy var noteBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(pressBtn), for: .touchUpInside)
        btn.layer.borderColor = Colors.green.cgColor
        btn.layer.borderWidth = 2
        btn.layer.cornerRadius = 10
        btn.sizeToFit()
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
    
    @objc func pressBtn() {
        guard let click = self.onClick else { return }
        click()
    }
    
    func bindCell(data: Reminder) {
        noteTitle.text = data.title
        noteDate.text = data.limitDate.description
        noteDescription.text = data.notes
        descriptionIsEmpty = false
        if let description = data.notes, description == nil || description.isEmpty {
            descriptionIsEmpty = true
        }
    }
    
    func setUp() {
        addSubview(contentView)
        contentView.addSubview(noteView)
        noteView.addSubview(noteBtn)
        noteView.addSubview(noteTitle)
        noteView.addSubview(noteDate)
        noteView.addSubview(noteDescription)
        constrains()
    }
    
    func constrains() {
        NSLayoutConstraint.activate([
            noteView.topAnchor.constraint(equalTo: topAnchor),
            noteView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            noteView.bottomAnchor.constraint(equalTo: bottomAnchor),
            noteView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            noteBtn.centerYAnchor.constraint(equalTo: noteView.centerYAnchor),
            noteBtn.leadingAnchor.constraint(equalTo: noteView.leadingAnchor, constant: 5),
            noteBtn.heightAnchor.constraint(equalToConstant: 20),
            noteBtn.widthAnchor.constraint(equalToConstant: 20),
            
            noteTitle.topAnchor.constraint(equalTo: noteView.topAnchor, constant: 5),
            noteTitle.leadingAnchor.constraint(equalTo: noteBtn.trailingAnchor, constant: 10),
            noteTitle.trailingAnchor.constraint(equalTo: noteView.trailingAnchor, constant: -5),
            noteTitle.bottomAnchor.constraint(equalTo: noteDate.topAnchor),
            
            noteDate.centerYAnchor.constraint(equalTo: noteView.centerYAnchor),
            noteDate.leadingAnchor.constraint(equalTo: noteTitle.leadingAnchor),
            noteDate.trailingAnchor.constraint(equalTo: noteTitle.trailingAnchor),
            
            noteDescription.topAnchor.constraint(equalTo: noteDate.bottomAnchor),
            noteDescription.leadingAnchor.constraint(equalTo: noteDate.leadingAnchor),
            noteDescription.trailingAnchor.constraint(equalTo: noteDate.trailingAnchor),
            noteDescription.bottomAnchor.constraint(equalTo: noteView.bottomAnchor, constant: -5)

        ])
    }
}
