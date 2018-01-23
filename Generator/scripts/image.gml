///image(size,path,[amount])
//returns the file path

//var img=surface_create(argument[0],argument[0])
if pictureSurfaceSize!=argument[0]{
    pictureSurfaceSize=argument[0]
    show_debug_message("resized surface")
    if surface_exists(pictureSurface){
        surface_resize(pictureSurface,argument[0],argument[0])
    }else{
        pictureSurface=surface_create(argument[0],argument[0])
    }
}

if !surface_exists(pictureSurface){
    pictureSurface=surface_create(argument[0],argument[0])
    show_debug_message("created image")
}

var imgPath="pictures/"+argument[1]+"/"+string(pictureCount)+".png";

surface_set_target(pictureSurface)
draw_clear(c_black)

//draw_set_color(make_colour_hsv(irandom(255),255,255))

var aaa=irandom(25);
if argument_count>2{
    aaa=irandom(argument[2])
}
repeat(aaa){
    draw_set_color(make_colour_hsv(irandom(255),255,255))
    switch(irandom(3)){
        case 0:
            draw_line(irandom(argument[0]),irandom(argument[0]),irandom(argument[0]),irandom(argument[0]))
        break;
        case 1:
            draw_rectangle(irandom(argument[0]),irandom(argument[0]),irandom(argument[0]),irandom(argument[0]),irandom(1))
        break;
        case 2:
            draw_circle(irandom(argument[0]),irandom(argument[0]),irandom(30),irandom(1))
        break;
        case 3:
            draw_triangle(irandom(argument[0]),irandom(argument[0]),irandom(argument[0]),irandom(argument[0]),irandom(argument[0]),irandom(argument[0]),irandom(1))
        break;
    }
}
surface_reset_target()

surface_save(pictureSurface,imgPath)
pictureCount++

return imgPath;
