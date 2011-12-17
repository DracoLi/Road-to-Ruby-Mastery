require 'net/http'
require 'net/https'

url = URI.parse('https://example.com/')

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true if url.scheme == 'https'
request = Net::HTTP::Post.new(url.path)
request.set_form_data({'credit_card_number' => '12324242442424'})
puts http.request(request).body
