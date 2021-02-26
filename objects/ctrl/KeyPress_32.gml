var guests = findGuests(5);
guestList = guests.map(function(elem, pos) {
	return getLimitedDescriptionStruct(elem, pos+1);
});