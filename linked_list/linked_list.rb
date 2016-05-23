require 'pry-byebug'

class Node
	attr_accessor :value, :next_node

	def initialize(value, next_node)
		@value = value 
		@next_node = next_node
	end
end

class LinkedList
	attr_reader :head
	
	def initialize(value)
		@head = Node.new(value, nil)
	end	

	def add(value)
		current_node = @head

		while current_node.next_node != nil
			current_node = current_node.next_node
		end

		current_node.next_node = Node.new(value, nil)
		self
	end

	#traverse down the list until we hit nil
	def display
		current_node = @head
		linked_list_array = []
		while current_node != nil
			
			linked_list_array << current_node.value
			current_node = current_node.next_node
		end 
		linked_list_array
	end

	def delete(value)
		current_node = @head 

		if current_node.value == value 
			@head = @head.next_node
		else
			while (current_node.next_node != nil) && (current_node != nil) && (current_node.next_node.value != value)
				current_node = current_node.next_node
			end

			if current_node.next_node != nil && current_node.next_node.value == value
				current_node.next_node = current_node.next_node.next_node
			end
		end
	end

	def remove_duplicates
		current_node = @head 
		counter_hash = {}
		while current_node != nil
			if !counter_hash[current_node.value] 
				counter_hash[current_node.value] = 1
			elsif counter_hash[current_node.value]
				counter_hash[current_node.value] +=1
			end
			current_node = current_node.next_node
		end
		counter_hash.each do |value, count|
			if count > 1
				(count -1).times do 
					self.delete(value)
				end
			end
		end

	end

	def kth_to_last(int)
		length = self.display.length
		self.display[length - int]

	end

	def is_palindrome
		# current_node = @head 
		# reversed = self.reverse_linked_list
		# p "*" * 50
		# p current_node
		# p "*" * 50
		# p reversed

		# if current_node
		# 	return true
		# else
		# 	false
		# end
	end

	def reverse_linked_list
		current_node = @head

		previous = nil
	
		while current_node
			next_temp = current_node.next_node
			current_node.next_node = previous
			previous = current_node
			current_node = next_temp
		end
		# p previous.value

		@head = previous
		
	end

	def loop_detection
		current_node = @head 
		counter_hash = {}
		while current_node
			if !counter_hash[current_node.value]
				counter_hash[current_node.value] = 1
			else 
				return current_node.value
			end
			current_node = current_node.next_node
					
		end

		# counter_hash.each do |values, count|
		# 	if count > 1
		# 		return values 
		# 	end
		# end
	end

	
end
def find_intersection(ll1, ll2)
	length_1 = ll1.display.length 
	length_2 = ll2.display.length 
	diff = (length_1 - length_2).abs 
	current_node_1 = ll1.head
	current_node_2 = ll2.head
	if length_1 > length_2
		counter = 0
		until counter == diff
		
			current_node_1 = current_node_1.next_node
			counter +=1 
		end
	elsif length_2 > length_1
		counter = 0
		until counter == diff
			current_node_2 = current_node_2.next_node
			counter += 1
		end
	 	 
	end

	
	while  current_node_1 && current_node_2
		if current_node_1.value == current_node_2.value
			return current_node_1
		else 
			current_node_1 = current_node_1.next_node
			current_node_2 = current_node_2.next_node
		end
		
	end
	false 
end

test1 = LinkedList.new(1)

test1.add(2)
test1.add(4)
test1.add(10)
test1.add(5)
test1.add(6)
test1.add(7)
# p test1.loop_detection




test2 = LinkedList.new(3)
test2.add(4)
test2.add(5)
test2.add(6)
test2.add(7)
p find_intersection(test1, test2)
