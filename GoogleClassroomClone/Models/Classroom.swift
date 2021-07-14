//
//  Classroom.swift
//  GoogleClassroomClone
//
//  Created by Hua Son Tung on 14/07/2021.
//

import Foundation

class Classroom {
    
    var classroomName: String
    var teacherName: String
    var subject: String
    
    init(classroomName: String, teacherName: String, subject: String) {
        self.classroomName = classroomName
        self.teacherName = teacherName
        self.subject = subject
    }
}
