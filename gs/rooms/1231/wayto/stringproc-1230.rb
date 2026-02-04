begin; 
  search_result = dothistimeout 'search', 5, /don't find anything|discover.*?opening|Round ?tim/; 
  waitrt?; 
end until search_result =~ /discover/; 
move('go opening')