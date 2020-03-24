(define (problem travelling_33)
		(:domain travelling_agent_cost)
		(:objects
			Agent - agent
			Car - car
			a b c d e f g h i - city)

		(:init
			(agentAt e) (not(visited d))
			(road e a) (road a e) (road a i) (road i a) (road i h) (road h i)
			(road h b) (road b h) (road h g) (road g h) (road g f) (road f g)
			(road f c) (road c f) (road f d) (road d f) (road c d) (road d c)
			(air a b) (air b a) (air c b) (air a c)
			(carRental e) (carRental a) (carRental c)
			(= (budget) 40) (= (total-cost) 0)
			(= (maxBus) 35) (= (maxCar) 39) (= (maxPlane) 30) (= (maxHire) 37)
			(carReturned)
		)

		(:goal 	(and
						(visited d)
						(agentAt e)
						(not (carRented e))
						(not (carRented a))
						(not (carRented c))))
)
