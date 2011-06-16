require 'open-uri'

class Player < ActiveRecord::Base
  def parse_data
    doc = Nokogiri::HTML(open(profile_path))

    self.wins = parse_wins doc
    self.name = parse_name doc
    self.avatar = parse_avatar doc
  end

  private

  def parse_wins(doc)
    doc.css('.campaign-casual h2').first.content
  end

  def parse_name(doc)
    doc.css('#profile-header h2').first.content
  end

  def parse_avatar(doc)
    avatar_style = doc.css('#portrait span').first["style"]
    avatar_style.sub "url('", "url('http://us.battle.net"
  end
end
