f = [lambda {|num| num[0].to_i}, lambda {|num| num[1].to_i}]

#x = %w[05 04 33 99 34 19 15 35 87 53 69 50 87 02 37 62 89 10 05 60]
x = %w[04 11 57 29 03 16 92 21 22 05 43 79 61 28 78 47 51 45 82 87]
#x = %w[99 51 89 86 53 48 94 36 06 07 92 17 64 21 20 80 66 94 54]
#x = %w[79 95 04 37 92 95 12 52 70 14]
#x = %w[29 78 79 87 92]
p x.join(')(')

def pareto(f, x)
	p = x, i = 0, j = 1
	while(true)
		if f.all? { |func_i| func_i.call(x[i]) > func_i.call(x[j])}
			x[j] = '00'
			if j < x.length-1
				j = j + 1
			else
				if i < x.length-2
					i = i+1
					j = i+1
				else
					break
				end
			end
		elsif f.all? { |func_i| func_i.call(x[i]) < func_i.call(x[j])}
			x[i] = '00'
			(i=i+1) and (j=i+1) if i < x.length-2 or break
		else
			if j < x.length-1
				j = j+1
			else
				(i=i+1) and (j=i+1) if i < x.length-2 or break
			end			
		end
	end
end

pareto(f,x)

p x.select {|num| num != '00'}
