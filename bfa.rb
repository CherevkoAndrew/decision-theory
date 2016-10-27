arr = [05,04,33,99,34,
		19,15,35,87,53,
		69,50,87,02,37,
		62,89,10,05,60]


def nfa(arr, container_size)
	containers = []
	curr_con = {
		:max_weight => 100,
		:curr_weight => 0,
		:cargo => []
	}
	containers.push curr_con
	
	arr.each.with_index do |weight, i|
		if weight + curr_con[:curr_weight] > curr_con[:max_weight] then
			curr_con = containers.find_all { |c| c[:curr_weight] + weight <= c[:max_weight]
				}.max {|a, b| a[:curr_weight] <=> b[:curr_weight]}
			unless curr_con then
				curr_con = {
					:max_weight => 100,
					:curr_weight => 0,
					:cargo => []
				}
				containers.push curr_con
			end
		end
		curr_con[:cargo].push i
		curr_con[:curr_weight] += weight
		curr_con = containers.last
	end	
	containers
end

(nfa arr, 100).each {|c| p c}


