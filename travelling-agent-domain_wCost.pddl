(define (domain travelling_agent_cost)
    (:requirements :fluents :adl :typing :equality)

    (:types
    	city		; represented by a node on the map
        bus     ;
    	car			;
		agent		;
		plane		;
    )

    (:constants
        ;; You should not need to add any additional constants
        Agent - agent
    )

    (:predicates
		    (agentAt			?city - city)	; the agent is at city ?c
		    (carAt 				?city - city)	; the car is at city ?c

		    (road	?c1 - city ?c2 - city)	; city ?c1 and city ?c2 are connected by a single road
		    (air	?c1 - city ?c2 - city)	; city ?c1 and city ?c2 are connected by a single air route (?c1 -> ?c2)

		    (visited 			?city - city)	; the agent has visited city ?c
            )

    (:functions (total-cost) (budget) (testBudget))


    (:action ride
      :parameters (?from ?to - city)

      :precondition (and
  	  				(agentAt ?from)
  					(road ?from ?to)
                    (= (testBudget) (total-cost))
                    (increase (testBudget) 5)
                    (<= (testBudget) (budget)))

      :effect (and
  	  		  (not (agentAt ?from))
  			  (agentAt ?to)
              (= (total-cost) (testBudget))))

    (:action drive
      :parameters (?from ?to - city)

      :precondition (and
	  				(agentAt ?from)
          	        (carAt ?from)
			        (road ?from ?to)
                    (= (testBudget) (total-cost))
                    (increase (testBudget) (1))
                    (<= (testBudget) (budget)))

      :effect (and
	  		  (not (agentAt ?from))
			  (not (carAt ?from))
			  (agentAt ?to)
          	  (carAt ?to)
              (= (total-cost) (testBudget))))


	(:action fly
      :parameters (?from ?to - city)

      :precondition (and
	  				(agentAt ?from)
					(air ?from ?to)
                    (= (testBudget) (total-cost))
                    (increase (testBudget) 10)
                    (<= (testBudget) (budget)))

      :effect (and
	  		  (not (agentAt ?from))
			  (agentAt ?to)
              (= (total-cost) (testBudget))))


	(:action visit
      :parameters (?c - city)

      :precondition (and
	  				(agentAt ?c)
				    (not (visited ?c)))

      :effect (and
			  (visited ?c)))
)
