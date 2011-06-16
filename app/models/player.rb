require 'open-uri'

class Player < ActiveRecord::Base
  def parse_data
    doc = Nokogiri::HTML(open(profile_path))

    self.wins = doc.css('.campaign-casual h2').first.content
    self.name = doc.css('#profile-header h2').first.content
    self.avatar = doc.css('#portrait span').first["style"].scan(/url\(\'([^']+)\'\)/)[0][0]
  end
end
