SELECT flight_id, flight_no, status
FROM flights 
WHERE status = 'On Time';


SELECT * FROM bookings WHERE total_amount >= 1000000;

SELECT * FROM aircrafts_data;


SELECT flight_id, flight_no FROM flights WHERE aircraft_code = '733';

SELECT * FROM tickets WHERE passenger_name LIKE 'IRINA%';