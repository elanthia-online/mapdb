result = ""
until result =~ /The mirror won't turn any farther to the right/
  fput "turn mirror right"
  result = matchwait("The mirror won't turn any farther to the right", "You turn the oak-framed mirror slightly to the right")
end
until result =~ /from the base of the statue onto the center of the statue/
  fput "tilt mirror"
  result = matchwait("from the base of the statue onto the center of the statue", "You tilt the oak-framed mirror up until it flips around", "You tilt the oak-framed mirror up slightly")
  if /flips around/.match?(result)
    fput "turn mirror left"
    result = matchwait("from the base of the statue onto the center of the statue", "You turn the oak-framed mirror slightly to the left", "The mirror won't turn any farther to the left")
    if /The mirror won't turn any farther to the left/.match?(result)
      4.times { fput "turn mirror right" }
    end
  end
end
move "go shadow"
