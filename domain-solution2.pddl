(define (domain travelling_agent)
    (:requirements :adl :typing :equality)

    (:types
    	city		; represented by a node on the map
        bus         ;
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

		    (visited 			?city - city))	; the agent has visited city ?c


    (:action drive
      :parameters (?from ?to - city)

      :precondition (and
	  		        (agentAt ?from)
          	        (carAt ?from)
			        (road ?from ?to))

      :effect (and
	  		  (not (agentAt ?from))
			  (not (carAt ?from))
			  (agentAt ?to)
          	  (carAt ?to)))


	(:action fly
      :parameters (?from ?to - city)

      :precondition (and
	  				(agentAt ?from)
					(air ?from ?to))

      :effect (and
	  		  (not (agentAt ?from))
			  (agentAt ?to)))


	(:action visit
      :parameters (?c - city)

      :precondition (and
	  				(agentAt ?c)
					(not (visited ?c)))

      :effect (and
			  (visited ?c)))
)
