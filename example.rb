require_relative "example"
require "test/unit"
 
class TestMake < Test::Unit::TestCase
 
  def test_simple
  	a = Sequence.new('1')
  	s = gets
  	assert(s.count('a-zA-Z') == 0, 'Не тот тип!')
    assert_instance_of(Fixnum, s.to_i, 'Не тот тип!')
    b = Make.new(a)
    b.make_seq(s.to_i)
  end
 
end

class Sequence
	attr_accessor :sequence
	def initialize(s)
		@sequence = s + "\n"
	end
	def len
		return @sequence.length
	end
end

class Make
	attr_accessor :tmp, :count, :s
	def initialize(s)
		@s = s
		@tmp = ''
		@count = 1
		@len = @s.len
	end
	def make_seq(n)
		if n == 1
			print 1
		end
		for j in 1..(n-1) do
			if j == 1
				puts 1
			end
			for i in 1..(@s.len-1) do
				if @s.sequence[i] != @s.sequence[i-1]
					@tmp += count.to_s
					@tmp += @s.sequence[i-1]
					@count = 1
		  		else
					@count += 1
		  		end
			end
			@s = Sequence.new(@tmp)
			@tmp = ''
			print(@s.sequence)
  		end
	end
end

a = Sequence.new('1')
b = Make.new(a)
# result = b.make_seq(4)