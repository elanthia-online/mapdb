while line = get
  if /The crew hurriedly puts out the gangplank\.|Solhaven\.\.\..+ ashore!/.match?(line)
    fput "out"
    break
  end
end
