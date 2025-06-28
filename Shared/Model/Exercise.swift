//
//  Exercise.swift
//  Workout App
//
//  Created by Jonathan Young on 6/26/25.
//

import SwiftUI
import SwiftData

@Model
class Exercise: Alphabetizable {
    var id: String { self.name }
    @Attribute(.unique)
    var name: String
    var exerciseDescription: String?
    var imageString: String?
    var muscleType: MuscleType
    var secondaryMuscleTypes: [MuscleType]
    var equipmentType: EquipmentType
    
    @Relationship(deleteRule: .cascade) var sets: [ExerciseSet] = []
    
    init(name: String, exerciseDescription: String? = nil, imageString: String? = nil, muscleType: MuscleType, secondaryMuscleTypes: [MuscleType] = [], equipmentType: EquipmentType) {
        self.name = name
        self.exerciseDescription = exerciseDescription
        self.imageString = imageString
        self.muscleType = muscleType
        self.secondaryMuscleTypes = secondaryMuscleTypes
        self.equipmentType = equipmentType
    }
}
