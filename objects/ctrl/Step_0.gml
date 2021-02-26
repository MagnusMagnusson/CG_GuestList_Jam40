if(save_gif){
if count == 0
    {
    gif_image = gif_open(room_width, room_height);
    }
else if count < 30*30
    {
    gif_add_surface(gif_image, application_surface, 100 / 30);
    }
else
    {
    gif_save(gif_image, "Street.gif");
    count = 0;
    save_gif = false;
    }
count++; 
}