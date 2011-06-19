require 'open-uri'

class Player
  include Mongoid::Document

  field :profile_path, :type => String
  field :initial_points, :type => Integer
  field :avatar, :type => String
  field :wins, :type => Integer
  field :name, :type => String

  def self.update_players!
    all.each do |player|
      player.parse_data
      player.save!
    end
  end

  def parse_data
    doc = Nokogiri::HTML(open(profile_path))

    self.wins = parse_wins doc
    self.name = parse_name doc
    self.avatar = parse_avatar doc
  end

  def rank_wins
    wins - initial_points
  end

  private

  def parse_wins(doc)
    doc.css('.module-body h2').first.content
  end

  def parse_name(doc)
    doc.css('#profile-header h2').first.content
  end

  def parse_avatar(doc)
    avatar_style = doc.css('#portrait span').first["style"]
    avatar_style.sub "url('", "url('http://us.battle.net"
  end
end
