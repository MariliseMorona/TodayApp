//
//  NoteModel.swift
//  TodayApp
//
//  Created by Marilise Morona on 01/06/23.
//

import Foundation

class Reminder {
    let title: String
    let limitDate: Date
    let notes: String?
    var concluded: Bool
    
    init(title: String, limitDate: Date, notes: String?, concluded: Bool){
        self.title = title
        self.limitDate = limitDate
        self.notes = notes
        self.concluded = concluded
    }
}

extension Reminder {
    static var listReminders = [
        Reminder(
            title: "Refatorar GitHub",
            limitDate: Date().addingTimeInterval(800),
            notes: "Selecionando projetos",
            concluded: true),
        
        Reminder(
            title: "Refatorar GitHub",
            limitDate: Date().addingTimeInterval(900),
            notes: "Excluindo projetos",
            concluded: true),
        
        Reminder(
            title: "Refatorar GitHub",
            limitDate: Date().addingTimeInterval(300),
            notes: "Inserindo projeto de playground",
            concluded: false),
        
        Reminder(
            title: "Refatorar GitHub",
            limitDate: Date().addingTimeInterval(200),
            notes: "",
            concluded: true),
        
        Reminder(
            title: "Refatorar GitHub",
            limitDate: Date().addingTimeInterval(100),
            notes: "Atualizando perfil",
            concluded: true),
        
        Reminder(
            title: "Refatorar GitHub",
            limitDate: Date().addingTimeInterval(700),
            notes: "Inserindo bagdes",
            concluded: false),
        
        Reminder(
            title: "Refatorar GitHub",
            limitDate: Date().addingTimeInterval(750),
            notes: "",
            concluded: true)
    ]
}
