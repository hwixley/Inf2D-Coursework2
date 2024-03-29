(define (problem travelling_31)
		(:domain travelling_agent_bus)
		(:objects
			Agent - agent
			Car - car
			a b c d e f g h i - city)

		(:init
			(agentAt e) (carAt e) (not(visited d))
			(road e a) (road a e) (road a i) (road i a) (road i h) (road h i)
			(road h b) (road b h) (road h g) (road g h) (road g f) (road f g)
			(road f c) (road c f) (road f d) (road d f) (road c d) (road d c)
			(air a b) (air b a) (air c b) (air a c)
		)

		(:goal 	(and
						(visited d)
						(carAt e)
						(agentAt e)))
)
