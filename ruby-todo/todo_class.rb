class Todo
	attr_reader :type, :des, :num
	def initialize(type, des, num)
		@type = type
		@des = des
    @num = num
	end
end
