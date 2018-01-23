///sentence(min,max)

var ___s="";
repeat(irandom_range(argument[0],argument[1])){
    ___s+=string_replace_all(string_replace_all(string_replace_all(string_replace_all(string(torto(1,15,1)),"}",""),"{",""),",","")," ","")+" ";
}
return ___s;
