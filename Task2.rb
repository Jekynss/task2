require 'rubygems'
require 'mechanize'
require 'json'
a = Mechanize.new { |agent|
  agent.user_agent_alias = 'Mac Safari'
}

page=a.get('https://alfabank.ru/ext-json/0.2/exchange/cash?offset=0&limit=2&mode=rest')

#page.body.each_line {|str| puts str if str.include? 'class="h'}
puts "-----------------------------------------------------------------"
#puts page.body.each_char {|elem| print elem}
var=page.body.to_json

var=var.split('\\')
cost_usd=var[var.find_index('"value')+1]
cost_usd=cost_usd.slice(2,cost_usd.length-3)
puts "currency #{cost_usd}"
puts ARGV[0].to_f*cost_usd.to_f
