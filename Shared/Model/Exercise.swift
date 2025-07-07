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
    var note: String
    var exerciseDescription: String?
    var howTo: [String]?
    var imageString: String?
    var muscleType: MuscleType
    var secondaryMuscleTypes: [MuscleType]
    var equipmentType: EquipmentType
    var exerciseType: ExerciseType
    
    @Relationship(deleteRule: .cascade) var previousSets: [ExerciseSet] = []
    
    init(name: String, note: String = "", exerciseDescription: String? = nil, howTo: [String]? = nil, imageString: String? = nil, muscleType: MuscleType, secondaryMuscleTypes: [MuscleType] = [], equipmentType: EquipmentType, exerciseType: ExerciseType, previousSets: [ExerciseSet] = []) {
        self.name = name
        self.note = note
        self.exerciseDescription = exerciseDescription
        self.howTo = howTo
        self.imageString = imageString
        self.muscleType = muscleType
        self.secondaryMuscleTypes = secondaryMuscleTypes
        self.equipmentType = equipmentType
        self.exerciseType = exerciseType
        self.previousSets = previousSets
    }
}

extension Exercise {
    func getStringSecondaryMuscleTypes() -> String {
        var stringSecondaryMuscleTypes: String = ""
        for (i, secondaryMuscleType) in self.secondaryMuscleTypes.enumerated() {
            stringSecondaryMuscleTypes += secondaryMuscleType.rawValue
            if i != self.secondaryMuscleTypes.count - 1 {
                stringSecondaryMuscleTypes += ", "
            }
        }
        return stringSecondaryMuscleTypes
    }
}
