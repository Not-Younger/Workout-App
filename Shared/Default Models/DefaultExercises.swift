//
//  DefaultExercises.swift
//  Workout App
//
//  Created by Jonathan Young on 6/26/25.
//

import Foundation

let DEFAULT_EXERCISES: [Exercise] = [
    Exercise(name: "Bench Press (Barbell)", exerciseDescription: "A compound chest exercise where you press a barbell upward from a lying position to target the pectorals, triceps, and shoulders.", muscleType: .chest, equipmentType: .barbell, exerciseType: .weightedReps),
    Exercise(name: "Incline Bench Press (Barbell)", exerciseDescription: "Performed on an incline bench to emphasize the upper chest and front deltoids.", muscleType: .chest, equipmentType: .barbell, exerciseType: .weightedReps),
    Exercise(name: "Decline Bench Press (Barbell)", exerciseDescription: "Targets the lower portion of the chest by pressing the barbell on a declined bench.", muscleType: .chest, equipmentType: .barbell, exerciseType: .weightedReps),
    Exercise(name: "Dumbbell Chest Press", exerciseDescription: "Similar to the bench press, but using dumbbells to engage stabilizer muscles more intensely.", muscleType: .chest, equipmentType: .dumbbells, exerciseType: .weightedReps),
    Exercise(name: "Cable Chest Fly", exerciseDescription: "Isolation chest exercise where cables are used to bring arms together in a wide arc, targeting the pectorals.", muscleType: .chest, equipmentType: .machine, exerciseType: .weightedReps),
    Exercise(name: "Push-Up", exerciseDescription: "Bodyweight chest and triceps exercise performed by lowering and raising your body using your arms.", muscleType: .chest, equipmentType: .bodyweight, exerciseType: .bodyweightReps),
    
    Exercise(name: "Squat (Barbell)", exerciseDescription: "Compound leg movement where a barbell is loaded on the shoulders and the body is lowered to a seated position and then driven back up.", muscleType: .quadriceps, equipmentType: .barbell, exerciseType: .weightedReps),
    Exercise(name: "Front Squat (Barbell)", exerciseDescription: "A barbell squat variation where the bar is held in front of the shoulders to emphasize the quads and core.", muscleType: .quadriceps, equipmentType: .barbell, exerciseType: .weightedReps),
    Exercise(name: "Squat (Smith Machine)", exerciseDescription: "A guided barbell squat using the smith machine to assist with balance and form.", muscleType: .quadriceps, equipmentType: .machine, exerciseType: .weightedReps),
    Exercise(name: "Leg Press", exerciseDescription: "Machine-based compound exercise that targets quads, hamstrings, and glutes by pushing weight away using the legs.", muscleType: .quadriceps, equipmentType: .machine, exerciseType: .weightedReps),
    Exercise(name: "Lunges (Dumbbell)", exerciseDescription: "A unilateral leg movement where you step forward and lower into a lunge while holding dumbbells.", muscleType: .glutes, equipmentType: .dumbbells, exerciseType: .weightedReps),
    Exercise(name: "Step-Up (Dumbbell)", exerciseDescription: "A leg and glute-focused movement where you step up onto a platform while holding dumbbells.", muscleType: .glutes, equipmentType: .dumbbells, exerciseType: .weightedReps),
    
    Exercise(name: "Romanian Deadlift (Barbell)", exerciseDescription: "Targets the hamstrings and glutes by hinging at the hips with a slight bend in the knees while lowering a barbell.", muscleType: .hamstrings, equipmentType: .barbell, exerciseType: .weightedReps),
    Exercise(name: "Deadlift (Barbell)", exerciseDescription: "A full-body compound lift that involves lifting a barbell from the ground to a standing position.", muscleType: .fullBody, equipmentType: .barbell, exerciseType: .weightedReps),
    Exercise(name: "Sumo Deadlift (Barbell)", exerciseDescription: "Deadlift variation with a wide stance, placing more emphasis on the inner thighs and glutes.", muscleType: .glutes, equipmentType: .barbell, exerciseType: .weightedReps),
    Exercise(name: "Kettlebell Swing", exerciseDescription: "Explosive movement targeting the posterior chain, where a kettlebell is swung between the legs to shoulder height.", muscleType: .hamstrings, equipmentType: .kettlebell, exerciseType: .repsOnly),
    
    Exercise(name: "Overhead Press (Barbell)", exerciseDescription: "Shoulder and triceps compound lift where a barbell is pressed overhead from the chest.", muscleType: .shoulders, equipmentType: .barbell, exerciseType: .weightedReps),
    Exercise(name: "Shoulder Press (Dumbbell)", exerciseDescription: "A vertical pressing movement using dumbbells to target the shoulders and triceps.", muscleType: .shoulders, equipmentType: .dumbbells, exerciseType: .weightedReps),
    Exercise(name: "Lateral Raise (Dumbbell)", exerciseDescription: "An isolation movement that targets the lateral deltoids by raising dumbbells outward to shoulder level.", muscleType: .shoulders, equipmentType: .dumbbells, exerciseType: .repsOnly),
    Exercise(name: "Cable Lateral Raise", exerciseDescription: "Similar to dumbbell lateral raises, but using cable resistance for constant tension on the shoulders.", muscleType: .shoulders, equipmentType: .machine, exerciseType: .repsOnly),
    
    Exercise(name: "Lat Pulldown", exerciseDescription: "Machine-based pulling exercise that targets the lats by pulling a bar down to your chest.", muscleType: .lats, equipmentType: .machine, exerciseType: .weightedReps),
    Exercise(name: "Pull-Up", exerciseDescription: "A bodyweight back and biceps exercise where you pull your body up until your chin is above the bar.", muscleType: .lats, equipmentType: .bodyweight, exerciseType: .bodyweightReps),
    Exercise(name: "Barbell Row", exerciseDescription: "Bent-over pulling movement that targets the lats and upper back by rowing a barbell toward your torso.", muscleType: .upperBack, equipmentType: .barbell, exerciseType: .weightedReps),
    Exercise(name: "Seated Cable Row", exerciseDescription: "Cable machine exercise that targets the back muscles through a rowing motion in a seated position.", muscleType: .upperBack, equipmentType: .machine, exerciseType: .weightedReps),
    
    Exercise(name: "Bicep Curl (Dumbbell)", exerciseDescription: "An isolation arm exercise where dumbbells are curled upward to contract the biceps.", muscleType: .biceps, equipmentType: .dumbbells, exerciseType: .weightedReps),
    Exercise(name: "Hammer Curl (Dumbbell)", exerciseDescription: "A bicep variation where dumbbells are curled with a neutral grip, also engaging the brachialis.", muscleType: .biceps, equipmentType: .dumbbells, exerciseType: .weightedReps),
    
    Exercise(name: "Triceps Pushdown (Cable)", exerciseDescription: "A triceps isolation movement performed on a cable machine, pushing the handle down until the arms are extended.", muscleType: .triceps, equipmentType: .machine, exerciseType: .weightedReps),
    Exercise(name: "Skull Crushers (Barbell)", exerciseDescription: "Triceps isolation exercise performed lying down, lowering a barbell to your forehead and pressing it back up.", muscleType: .triceps, equipmentType: .barbell, exerciseType: .weightedReps),
    
    Exercise(name: "Crunch", exerciseDescription: "Abdominal exercise where the upper torso is curled toward the knees to engage the core.", muscleType: .abdominals, equipmentType: .bodyweight, exerciseType: .bodyweightReps),
    Exercise(name: "Hanging Leg Raise", exerciseDescription: "A core movement where you raise your legs while hanging from a pull-up bar to target the lower abs.", muscleType: .abdominals, equipmentType: .bodyweight, exerciseType: .bodyweightReps),
    Exercise(name: "Running (Outdoor)", exerciseDescription: "A cardiovascular exercise done outdoors, typically tracked by time, distance, and pace.", muscleType: .fullBody, equipmentType: .bodyweight, exerciseType: .distanceTime),
    Exercise(name: "Treadmill Run", exerciseDescription: "Running on a treadmill, allowing for control over speed and incline.", muscleType: .fullBody, equipmentType: .machine, exerciseType: .distanceTime),
    Exercise(name: "Cycling (Outdoor)", exerciseDescription: "An endurance activity that targets the legs and improves cardiovascular fitness.", muscleType: .quadriceps, equipmentType: .machine, exerciseType: .distanceTime),
    Exercise(name: "Stationary Bike", exerciseDescription: "Indoor cycling workout that improves lower body endurance and burns calories.", muscleType: .quadriceps, equipmentType: .machine, exerciseType: .distanceTime),
    Exercise(name: "Rowing Machine", exerciseDescription: "A full-body cardio exercise using a rowing motion, excellent for endurance and muscle engagement.", muscleType: .fullBody, equipmentType: .machine, exerciseType: .distanceTime),
    Exercise(name: "Jump Rope", exerciseDescription: "A fast-paced cardio exercise using a rope to jump over continuously.", muscleType: .calves, equipmentType: .bodyweight, exerciseType: .timeOnly),
    Exercise(name: "Elliptical Trainer", exerciseDescription: "Low-impact cardio using a machine to simulate walking or running with arm movement.", muscleType: .fullBody, equipmentType: .machine, exerciseType: .distanceTime),
    Exercise(name: "Walking", exerciseDescription: "A low-impact aerobic activity ideal for all fitness levels, usually tracked by distance and time.", muscleType: .fullBody, equipmentType: .bodyweight, exerciseType: .distanceTime),
    Exercise(name: "Stair Climber", exerciseDescription: "Cardio exercise using a machine to simulate stair climbing, targeting glutes and quads.", muscleType: .glutes, equipmentType: .machine, exerciseType: .timeOnly),
    Exercise(name: "Swimming", exerciseDescription: "Full-body cardio and resistance exercise done in water, tracked by time and distance.", muscleType: .fullBody, equipmentType: .bodyweight, exerciseType: .distanceTime),
]
