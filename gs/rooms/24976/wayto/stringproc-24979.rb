fput "lie tomb"
dothistimeout "sleep", 3, /^As you start to drift into unconsciousness/
wait_until { stunned? }
echo "** Waiting for stunned status to end... **"
wait_until { !stunned? }
fput "stand" until standing?
