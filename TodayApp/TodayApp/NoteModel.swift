//
//  NoteModel.swift
//  TodayApp
//
//  Created by Marilise Morona on 01/06/23.
//

import Foundation

struct Reminder {
    let title: String
    let limitData: Date
    let notes: String?
    let concluded: Bool
}

extension Reminder {
    static var listReminders = {
        Reminder(
            title: "Refatorar GitHub",
            limitData: Date().addingTimeInterval(800),
            notes: "Selecionando projetos",
            concluded: true);
        
        Reminder(
            title: "Refatorar GitHub",
            limitData: Date().addingTimeInterval(900),
            notes: "Excluindo projetos",
            concluded: true);
        
        Reminder(
            title: "Refatorar GitHub",
            limitData: Date().addingTimeInterval(300),
            notes: "Inserindo projeto de playground",
            concluded: false);
        
        Reminder(
            title: "Refatorar GitHub",
            limitData: Date().addingTimeInterval(200),
            notes: "",
            concluded: true);
        
        Reminder(
            title: "Refatorar GitHub",
            limitData: Date().addingTimeInterval(100),
            notes: "Atualizando perfil",
            concluded: true);
        
        Reminder(
            title: "Refatorar GitHub",
            limitData: Date().addingTimeInterval(700),
            notes: "Inserindo bagdes",
            concluded: false);
        
        Reminder(
            title: "Refatorar GitHub",
            limitData: Date().addingTimeInterval(750),
            notes: "",
            concluded: true)
    }
}
