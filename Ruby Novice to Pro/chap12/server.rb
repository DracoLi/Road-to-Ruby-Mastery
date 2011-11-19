require 'webrick'
require './bot'

# Class that responds to HTTP/Web requests and interacts with the bot
class BotServlet < WEBrick::HTTPServlet::AbstractServlet
  @@html = %q{
    <html><body>
    <form method="get">
      <h1>Talk to a bot</h1>
      %RESPONSE%
      <p>
        <b>You say:</b><input text="text" name="line" size="40" />
        <input type="submit" />
      </p>
    </form>
    </body></html>
  }
  
  def do_GET(request, response)
    response.status = 200;
    response.content_type = "text/html"
    
    if request.query['line'] && request.query['line'].length > 1
      bot_text = $bot.respond_to(request.query['line'])
    else
      bot_text = $bot.greeting
    end
    
    bot_text = %Q{<p><b>I say:</b> #{bot_text}</p>}
    response.body = @@html.sub(/\%RESPONSE\%/, bot_text)
  end
end

server = WEBrick::HTTPServer.new( :Port => 1234 )
$bot = Bot.new(:name => "DracoBot", :data_file => "draco.bot")
server.mount "/", BotServlet
trap("INT"){ server.shutdown }
server.start