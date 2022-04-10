//
//  Schedule.swift
//  Scedule 2
//
//  Created by mac on 10.04.2022.
//

import Foundation

struct Schedule {
    let name: String
    let toDo: String
    let timeOfDay: String
    

    static func setRandomSchedule(for times: Int) -> [Schedule] {
        let data = DataManage()
        var result: [Schedule] = []
       
        var funOrWork = ""
        let number = [0, 1]
        
        for _ in 1...times {
            
            let fun = data.toDoDataFun.randomElement()
            let work = data.toDoDataWork.randomElement()
            if number.randomElement() == 0 {
                funOrWork = fun ?? ""
            } else {
                funOrWork = work ?? ""
            }
            
            let name = data.namesData.randomElement()
            let timeOfDay = data.timeOfDayData.randomElement()
            
            
            result.append(Schedule(name: name ?? "", toDo: funOrWork , timeOfDay: timeOfDay ?? ""))
        }
        return result
    }
    
}


