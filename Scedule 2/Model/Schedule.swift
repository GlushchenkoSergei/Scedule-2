//
//  Schedule.swift
//  Scedule 2
//
//  Created by mac on 10.04.2022.
//

import Foundation

struct Schedule: Comparable {
    static func < (lhs: Schedule, rhs: Schedule) -> Bool {
        lhs.timeOfDay < rhs.timeOfDay
    }
    
    let name: String
    let toDo: String
    let timeOfDay: Int
    

    static func setRandomSchedule(for times: Int) -> [Schedule] {
//        let data = DataManage.shared
        var result: [Schedule] = []
       
        var funOrWork = ""
        let number = [0, 1]
        
        for _ in 1...times {
            
            let fun = DataManage.shared.toDoDataFun.randomElement()
            let work = DataManage.shared.toDoDataWork.randomElement()
            if number.randomElement() == 0 {
                funOrWork = fun ?? ""
            } else {
                funOrWork = work ?? ""
            }
            
            let name = DataManage.shared.namesData.randomElement()
            let timeOfDay = DataManage.shared.timeOfDayData.randomElement()
            
            
            result.append(Schedule(name: name ?? "", toDo: funOrWork , timeOfDay: timeOfDay ?? 0))
        }
        return result.sorted(by: <)
    }
    
}



