var guest = findGuest();
guest.id.image_xscale = 2;
var description = getDescriptionFromStruct(getFullDescriptionStruct(guest));

show_message(description);