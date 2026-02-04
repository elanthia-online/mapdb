begin; 
  search_result = dothistimeout 'search', 5, /don't find anything|discover.*?crack|Round ?tim/; 
  waitrt?; 
end until search_result =~ /discover/; 
move('go crack')