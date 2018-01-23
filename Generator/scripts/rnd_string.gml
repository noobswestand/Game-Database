///rnd_string(len)
var rnd_txt="abcdefghijklmnopqrstuvwxyz0123456789"+string_upper("abcdefghijklmnopqrstuvwxyz");
var rnd_str="";
for(i=0;i<argument0;i+=1){
    var index=irandom(string_length(rnd_txt));
    rnd_str+=string_copy(rnd_txt,index,1)
}
return rnd_str;
