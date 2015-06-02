class Family
  def initialize name
    @family_name = name
  end

  def add_father name
    @father = Parent.new name, "M"
    @children = []
  end

  def add_mother name
    @mother = Parent.new name, "F"
  end


  def add_child name
    @children << Child.new(name)
  end

  def each_member
    [@father, @mother, @children].flatten.each do |member|
      yield member
    end
  end
end


class Parent
  attr_accessor :name
  def initialize name, gender 
    @name = name
    @gender = gender
  end
end


class Child
  attr_accessor :name
  def initialize name
    @name = name
  end
end

require 'test/unit'
class IteratorPatternTest < Test::Unit::TestCase
  def test_iterator_pattern
    family = Family.new("surname")

    family.add_father "Dad"
    family.add_mother "Mom"
    family.add_child "Child 1"
    family.add_child "Child 2"
    family.add_child "Child 3"

    expected_output = ["Dad", "Mom", "Child 1", "Child 2", "Child 3"]
    names = []
    family.each_member{|member| names << member.name}
    assert_equal expected_output, names 
  end
end