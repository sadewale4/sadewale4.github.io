# Shim for running Jekyll 3.9 / Liquid 4.0.3 on Ruby >= 3.2
# Object#tainted? was removed in Ruby 3.2; Liquid 4.0.3 still calls it.
# GitHub Pages' production build runs an older Ruby, so this is only
# needed for local development. Use via:
#   RUBYOPT="-r./scripts/ruby4-compat.rb" bundle exec jekyll serve
class Object
  def tainted?
    false
  end
end
