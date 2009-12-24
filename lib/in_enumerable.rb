# Extends the Object type with the tasty 'in?' method, which tells you if an object is included
# in an Array or other enumerable value
module InEnumerable
  # Returns true if enumerable includes self.  Like this:
  #
  #   1.in? [1,2]          # => true
  #   3.in? [1,2]          # => false
  #
  # == Parameters
  # [enumerable]    Any value that implements an include? method.  E.g., Array, Hash, String, Range.
  def in?(enumerable)
    enumerable.include? self
  end
end

class Object
  include InEnumerable
end