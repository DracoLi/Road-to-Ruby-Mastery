require 'sinatra'

get '/' do
  %q{<form method="post">
      Enter Your name: <input type="text" name="name" />
      <input type="submit" value="Go!" />
    </form>}  
end

post '/' do
  "Hello #{params[:name]}"
end

get '/bye' do
  "Leaving already?"
end

get '/time' do
  Time.now.to_s
end

get '/add/:a/:b' do |a, b|
  (a.to_i + params[:b].to_i).to_s
end