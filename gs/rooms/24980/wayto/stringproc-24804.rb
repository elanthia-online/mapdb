echo "** Please wait.  Waiting for the stain to show up **"
line = get until line =~ /dark stains/
fput "get stain"
fput "lie" if standing?
line = fput "search" until line =~ /descending slope/
dothistimeout "go slope", 3, /You gradually make your way down the descending slope/
line = fput "search" until line =~ /opening/
dothistimeout "go opening", 3, /You duck down low and half-crawl into the opening/
fput "stand" until standing?
