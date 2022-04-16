//
//  DataManage.swift
//  Scedule 2
//
//  Created by mac on 10.04.2022.
//


class DataManage {
    static let shared = DataManage()
    
    var namesData = [
        "Сам",
        "tania",
        "alina",
        "koza",
        "nastia"
    ]
    
    var toDoDataFun = [
        "Погулять",
        "По",
        "💦",
        "позвонить",
        "Написать"
    ]
    
    var toDoDataWork = [
        "Учеба лекции",
        "Спорт Зал",
        "Книга"
    ]
    
    var timeOfDayData = [
        8,
        12,
        16,
        23
    ]
    
    private init() {}
    
}
