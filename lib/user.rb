module User  
  def self.interpret(command)
    responses = []
    
    if command.match(/^who\s+am\si$/i) || command.match(/^what\'?s?(\s+is)?\s+my\s(user)?name\??$/i)
      responses << {
        :command => "whoami",
        :explanation => "Gets your system username."
      }
    end
    
    if command.match(/^who\s+am\si$/i) || command.match(/^what\'?s?(\s+is)?\s+my\s((real|full|actual)\s+)?name\??$/i)
      responses << {
        :command => "finger `whoami` | awk -F: '{ print $3 }' | head -n1 | sed 's/^ //'",
        :explanation => "Gets your full name."
      }
    end

    if command.match(/^what\'?s?(\s+is)?(\s+my)?(\s+ip)?\s?(address)?\??$/i)
      responses << {
        :command => "curl ifconfig.me",
        :explanation => "Gets your external ip address."
      }
    end
    
    responses
  end
end

$executors << User
