while line = get
  if /The crew hurriedly puts out the gangplank\.|River's Rest\.\.\..+ ashore!/.match?(line)
    fput "out"
    break
  end
end
