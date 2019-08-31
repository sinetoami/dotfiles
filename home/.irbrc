begin
  require "pry-meta"
  Pry.start
  exit
rescue LoadError => error
  warn "=> Unable to load pry-meta"
end
