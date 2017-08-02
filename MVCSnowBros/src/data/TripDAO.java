package data;

import java.util.List;
import java.util.Set;

import entities.Destination;
import entities.Trip;

public interface TripDAO {

	public Trip createTrip(Trip trip);
	
	public Set<Trip> searchTrip(String search);
	
	public Trip updateTrip(Trip trip);
	
	public Trip deleteTrip(Trip trip);
	
	public List<Trip> allTrips();
	
	public Trip findTripById(int id);
	
	public Destination findDestinationByNameOrCreateNewDestination(String name);
	
}
