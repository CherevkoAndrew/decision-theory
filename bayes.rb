# -*- coding: utf-8 -*-
# ruby
$close = {
	'блайзер' => 6,
	'бушлат' => 48,
	'ватні штани' => 24,
	'в\'єтнамки' => 6,
	'джинси' => 12,
	'кепка' => 6,
	'кросівки' => 12,
	'куртка' => 24,
	'пальто' => 36,
	'рукавички' => 6,
	'светер' => 12,
	'сорочка' => 6,
	'футболка' => 6,
	'черевики' => 18,
	'чоботи' => 24,
	'шапка' => 12,
	'шорти' => 6
}

$sets = [
	{:wear => ['шапка','бушлат', 'рукавички', 'ватні штани', 'чоботи'], :weight => 9.5, :t => -99..-10},
	{:wear => ['шапка', 'пальто', 'рукавички', 'джинси', 'чоботи'], :weight => 7.5, :t => -9..0},
	{:wear => ['кепка', 'куртка', 'джинси', 'черевики'], :weight => 5.0, :t => 1..10},
	{:wear => ['светер', 'джинси', 'кросівки'], :weight => 3.0, :t => 11..20},
	{:wear => ['блайзер','сорочка','джинси', 'кросівки'], :weight => 3.0, :t => 21..30},
	{:wear => ['блайзер', 'футболка', 'шорти', 'в\'єтнамки'], :weight => 2.0, :t => 30..99},
]

weather = [-3, -2, 5, 12, 17, 22, 24, 23, 18, 11, 5, 0]


def bl(u, p)
	benefit = u.map.with_index{|x, i| x.map.with_index {|xj, j| xj*p[i][j] }.reduce(:+)}
	p benefit
	benefit.max
end

def newWear(currentSet, t)
	setForTemperature = $sets.find{|set| set[:t].include? t}
	wear = setForTemperature[:wear] - currentSet[:wear]
	price = $close.values_at(*wear).reduce(:+)
	{:wear => wear, :price => price || 0}
end
#u = [[1,1,1],[2,2,2],[3,3,3]]
#p = [[0.1,0.1,0.1],[0.2,0.2,0.2],[0.3,0.3,0.3]]

#p bl(u,p)
u = $sets.map {|set| weather.map {|t| (newWear set, t)[:price] + set[:weight]*10}}
#puts (newWear $sets[0], 5)[:price]
#u.each {|uu| p uu}
p1 = [[1.0/12.0]*12]*u.length

up = u.map.with_index {|uu, i| uu.map.with_index {|uuu, j| uuu*p1[i][j]}}
costs = up.map {|uu| uu.reduce(:+)}

p costs
