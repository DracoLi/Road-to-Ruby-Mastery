require 'yaml'

bot_data = {
  :presubs => [
    ["dont", "do not"],
    ["don't", "do not"],
    ["youre", "you're"],
    ["love", "like"],
    ["apologize", "are sorry"],
    ["dislike", "hate"],
    ["despise", "hate"],
    ["yeah", "yes"],
    ["mom", "family"],
    [" u ", "you"],
    ["Im", "I am"],
    ["of course", "yes"],
    ["nop", "no"],
    ["yap", "yes"],
    ["yep", "yes"]
  ],
  
  :responses => {
    :default => [
                  "I don't understand.",
                  "What?",
                  "Huh?",
                  "Tell me about something else.",
                  "I'm tired of this. Change the subject.",
                  "I am a serial entrepreneur."
                ],
    :greeting => [
                  "Hi. I'm [name]. You can ask me something!",
                  "Hey I'm [name]. What's on your mind today?",
                  "Howdy partner! My name is [name]. Do you like me?"
                 ],
    :farewell => ["Good bye!", "Au revior!"],
    'hello'   => [
                  "How's it going?",
                  "How do you do?",
                  "Enough of the pleasantries"
                 ],
    'sorry'   => ["There's no need to apologize."],
    'different' => [
                    "How is it different?",
                    "What has changed?"
                   ],
    'everyone *' => ["You think everyone *?"],
    'do not know' => ["Are you always so indecisive?"],
    'yes'         => ["At leat you're positive about something!", "Great", "Interesting answer..."],
    'you are *' => ["What makes you think that I am *?", "Are you so sure I am *?"],
    'i am *' => ["Is it normal for you to be *?", "Do you like being *?"],
    'i do not *' => ["Why don't you *?"],
    'what'       => ["Why do you ask?", "Why?", "I don't know. Do you?"],
    'no'         => ["Really?", "Fair enough"],
    'why does *' => [
                    "I don't know why *",
                    "Do you already know the answer?"
                    ],
    'why can\'t i *' => ["Do you want to *?"],
    'why can\'t you *' => ["Do you want me to *?"],
    'hates *' => ["Why do you think they hate *?"],
    'hate *' => ["Why don't you like *?", "Why the dislike of *?"],
    'i like *' => ["Why do you like *?", "Wow! I like *too!"],
    "why" => ["What do you think?", "I don't know.", "I will let you know 2mrw."],
    'you like *' => ["Why? Do you like *?", "Of course! I love *"],
    'you suck *' => ["Why do you think I suck *?", "Is that so?"]
  }
}

# Show the user the YAML data for the bot structure
puts bot_data.to_yaml

# Write the YAML data to file
f = File.open(ARGV.first || 'bot_data', 'w')
f.puts bot_data.to_yaml
f.close