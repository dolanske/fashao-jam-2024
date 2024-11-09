// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function approach(argument0,argument1,argument2){
if (argument0 < argument1)
    return min(argument0 + argument2, argument1); 
else
    return max(argument0 - argument2, argument1);
}