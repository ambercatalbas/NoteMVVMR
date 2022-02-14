//
//  HomeCellModel+Extension.swift
//  UIComponents
//
//  Created by AMBER ÇATALBAŞ on 10.02.2022.
//

extension HomeCellModel {
    
    convenience init(note: Note) {
        self.init(title: note.title ?? "",
                  description: note.note ?? "")
    }
}
