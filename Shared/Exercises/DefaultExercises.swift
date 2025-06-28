//
//  DefaultExercises.swift
//  Workout App
//
//  Created by Jonathan Young on 6/26/25.
//

import Foundation

let DEFAULT_EXERCISES: [Exercise] = [
    Exercise(name: "Bench Press (Barbell)", exerciseDescription: "A compound chest exercise where you press a barbell upward from a lying position to target the pectorals, triceps, and shoulders.", muscleType: .chest, equipmentType: .barbell),
    Exercise(name: "Incline Bench Press (Barbell)", exerciseDescription: "Performed on an incline bench to emphasize the upper chest and front deltoids.", muscleType: .chest, equipmentType: .barbell),
    Exercise(name: "Decline Bench Press (Barbell)", exerciseDescription: "Targets the lower portion of the chest by pressing the barbell on a declined bench.", muscleType: .chest, equipmentType: .barbell),
    Exercise(name: "Dumbbell Chest Press", exerciseDescription: "Similar to the bench press, but using dumbbells to engage stabilizer muscles more intensely.", muscleType: .chest, equipmentType: .dumbbells),
    Exercise(name: "Cable Chest Fly", exerciseDescription: "Isolation chest exercise where cables are used to bring arms together in a wide arc, targeting the pectorals.", muscleType: .chest, equipmentType: .machine),
    Exercise(name: "Push-Up", exerciseDescription: "Bodyweight chest and triceps exercise performed by lowering and raising your body using your arms.", muscleType: .chest, equipmentType: .bodyweight),
    
    Exercise(name: "Squat (Barbell)", exerciseDescription: "Compound leg movement where a barbell is loaded on the shoulders and the body is lowered to a seated position and then driven back up.", muscleType: .quadriceps, equipmentType: .barbell),
    Exercise(name: "Front Squat (Barbell)", exerciseDescription: "A barbell squat variation where the bar is held in front of the shoulders to emphasize the quads and core.", muscleType: .quadriceps, equipmentType: .barbell),
    Exercise(name: "Squat (Smith Machine)", exerciseDescription: "A guided barbell squat using the smith machine to assist with balance and form.", muscleType: .quadriceps, equipmentType: .machine),
    Exercise(name: "Leg Press", exerciseDescription: "Machine-based compound exercise that targets quads, hamstrings, and glutes by pushing weight away using the legs.", muscleType: .quadriceps, equipmentType: .machine),
    Exercise(name: "Lunges (Dumbbell)", exerciseDescription: "A unilateral leg movement where you step forward and lower into a lunge while holding dumbbells.", muscleType: .glutes, equipmentType: .dumbbells),
    Exercise(name: "Step-Up (Dumbbell)", exerciseDescription: "A leg and glute-focused movement where you step up onto a platform while holding dumbbells.", muscleType: .glutes, equipmentType: .dumbbells),
    
    Exercise(name: "Romanian Deadlift (Barbell)", exerciseDescription: "Targets the hamstrings and glutes by hinging at the hips with a slight bend in the knees while lowering a barbell.", muscleType: .hamstrings, equipmentType: .barbell),
    Exercise(name: "Deadlift (Barbell)", exerciseDescription: "A full-body compound lift that involves lifting a barbell from the ground to a standing position.", muscleType: .fullBody, equipmentType: .barbell),
    Exercise(name: "Sumo Deadlift (Barbell)", exerciseDescription: "Deadlift variation with a wide stance, placing more emphasis on the inner thighs and glutes.", muscleType: .glutes, equipmentType: .barbell),
    Exercise(name: "Kettlebell Swing", exerciseDescription: "Explosive movement targeting the posterior chain, where a kettlebell is swung between the legs to shoulder height.", muscleType: .hamstrings, equipmentType: .kettlebell),
    
    Exercise(name: "Overhead Press (Barbell)", exerciseDescription: "Shoulder and triceps compound lift where a barbell is pressed overhead from the chest.", muscleType: .shoulders, equipmentType: .barbell),
    Exercise(name: "Shoulder Press (Dumbbell)", exerciseDescription: "A vertical pressing movement using dumbbells to target the shoulders and triceps.", muscleType: .shoulders, equipmentType: .dumbbells),
    Exercise(name: "Lateral Raise (Dumbbell)", exerciseDescription: "An isolation movement that targets the lateral deltoids by raising dumbbells outward to shoulder level.", muscleType: .shoulders, equipmentType: .dumbbells),
    Exercise(name: "Cable Lateral Raise", exerciseDescription: "Similar to dumbbell lateral raises, but using cable resistance for constant tension on the shoulders.", muscleType: .shoulders, equipmentType: .machine),
    
    Exercise(name: "Lat Pulldown", exerciseDescription: "Machine-based pulling exercise that targets the lats by pulling a bar down to your chest.", muscleType: .lats, equipmentType: .machine),
    Exercise(name: "Pull-Up", exerciseDescription: "A bodyweight back and biceps exercise where you pull your body up until your chin is above the bar.", muscleType: .lats, equipmentType: .bodyweight),
    Exercise(name: "Barbell Row", exerciseDescription: "Bent-over pulling movement that targets the lats and upper back by rowing a barbell toward your torso.", muscleType: .upperBack, equipmentType: .barbell),
    Exercise(name: "Seated Cable Row", exerciseDescription: "Cable machine exercise that targets the back muscles through a rowing motion in a seated position.", muscleType: .upperBack, equipmentType: .machine),
    
    Exercise(name: "Bicep Curl (Dumbbell)", exerciseDescription: "An isolation arm exercise where dumbbells are curled upward to contract the biceps.", muscleType: .biceps, equipmentType: .dumbbells),
    Exercise(name: "Hammer Curl (Dumbbell)", exerciseDescription: "A bicep variation where dumbbells are curled with a neutral grip, also engaging the brachialis.", muscleType: .biceps, equipmentType: .dumbbells),
    
    Exercise(name: "Triceps Pushdown (Cable)", exerciseDescription: "A triceps isolation movement performed on a cable machine, pushing the handle down until the arms are extended.", muscleType: .triceps, equipmentType: .machine),
    Exercise(name: "Skull Crushers (Barbell)", exerciseDescription: "Triceps isolation exercise performed lying down, lowering a barbell to your forehead and pressing it back up.", muscleType: .triceps, equipmentType: .barbell),
    
    Exercise(name: "Crunch", exerciseDescription: "Abdominal exercise where the upper torso is curled toward the knees to engage the core.", muscleType: .abdominals, equipmentType: .bodyweight),
    Exercise(name: "Hanging Leg Raise", exerciseDescription: "A core movement where you raise your legs while hanging from a pull-up bar to target the lower abs.", muscleType: .abdominals, equipmentType: .bodyweight)
]
