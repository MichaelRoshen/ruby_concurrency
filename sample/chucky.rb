require '../lib/futurama'
require 'open-uri'
require 'json'
require 'benchmark'

class Chucky
  URL = 'http://api.icndb.com/jokes/random?limitTo=[nerdy]'

  def sequential
    open(URL) do |f|
      f.each_line { |line| puts JSON.parse(line)['value']['joke'] }
    end
  end

  def concurrent
    future { sequential }
  end

end

chucky = Chucky.new
100.times { chucky.concurrent } 
sleep 20
# 10.times { chucky.sequential } 
