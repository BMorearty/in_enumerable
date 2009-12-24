require 'helper'
require 'set'

class TestInEnumerable < Test::Unit::TestCase
  context "An Array [1,2]" do
    should "include 1 but not 3" do
      assert 1.in?([1,2])       # => true
      assert !3.in?([1,2])      # => false
    end
  end

  context "A Hash with keys 'a' and 'b'" do
    should "include 'a' but not 'z'" do
      h = { "a" => 100, "b" => 200 }
      assert "a".in?(h)         # => true
      assert !"z".in?(h)        # => false
    end
  end

  context "A String 'hello'" do
    should "include 'lo' and ?h but not 'ol'" do
      assert "lo".in?("hello")    # => true
      assert !"ol".in?("hello")   # => false
      assert ?h.in?("hello")      # => true
    end
  end

  context "A Range (1..50)" do
    should "include 25 but not 75" do
      assert 25.in?(1..50)        # => true
      assert !75.in?(1..50)       # => false
    end
  end

  context "A Set {1,2}" do
    should "include 1 but not 3" do
      s = Set.new([1,2])
      assert 1.in?(s)             # => true
      assert !3.in?(s)            # => false
    end
  end

  context "Module A included in B which has subclass C" do
    should "be in B and C but not in itself" do
      module A
      end
      class B
        include A
      end
      class C < B
      end
      assert A.in?(B)             # => true
      assert A.in?(C)             # => true
      assert !A.in?(A)            # => false
    end
  end
end
