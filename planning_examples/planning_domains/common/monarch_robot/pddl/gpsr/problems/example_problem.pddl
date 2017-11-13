(define (problem p01)

  (:domain gpsr) ; General Purpose Service Robot (in a home environment)

  (:objects
  	mbot - robot                             ; there is only one robot called mbot
    pedro person - person
  	entrance bedroom kitchen exit - location ; room locations
    dinner_table side_table - location       ; manipulation locations
  	crackers coke package - object           ; the world has this many objects
  )

  (:init

    ; cost is 0 at the beginning
  	(= (total-cost) 0)

    ; the robot at start is in the entrance of the house
  	(at_r mbot entrance)

    ; the robot gripper is empty
    (gripper_empty mbot)

    ; a person is at the kitchen
    (at_p person kitchen)

    ; pedro is located at the entrance
    (at_p pedro entrance)

    ; pedro is puzzled because he has a question
    (puzzled pedro)

    ; the cracker are located at the dinner table
  	(on crackers dinner_table)

  )

  (:goal
  	(and

      ; the crackers need to be put on the side table
  		(on crackers side_table)

      ; the gripper of the robot needs to be empty at the end
	  	(gripper_empty mbot)

      ; robot needs to be at the entrance at the end
		  (at_r mbot entrance)

      ; robot needs to ask pedro his name
      (known_p mbot pedro)

      ; mbot needs to introduce itself to pedro
      (known_r pedro mbot)

      ; pedro needs to be guided to the exit
      (at_p pedro exit)

      ; a person needs to be guided to the exit
      (at_p person exit)

      ; robot needs to find a person
      (found person)

      ; pedro is puzzled and needs his question to be answered
      (iluminated pedro)
	  )
  )

  ; the goal for the planner is to minimize the total cost
  (:metric minimize (total-cost))
)