require 'open-uri'

class Player < ActiveRecord::Base
  def get_data
    doc = Nokogiri::HTML(open(profile_path))
    self.wins = doc.css('.campaign-casual h2').first.content
  end
end
