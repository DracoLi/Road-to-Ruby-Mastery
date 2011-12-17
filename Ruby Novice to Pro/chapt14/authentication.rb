require 'net/http'

uri = URI.parse('http://browserspy.dk/password-ok.php');

Net::HTTP.start(uri.host, uri.port) do |http|
  req = Net::HTTP::Get.new(uri.path)
  req.basic_auth('test', 'test')
  puts http.request(req).body
end