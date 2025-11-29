require 'io/console'
require_relative '../lib/hangman'

class Player

  private

  attr_accessor :hangman, :info

  def initialize
    self.hangman = Hangman.new
    self.info = {}
  end

  def match_info
    "Misses: #{info[:misses]}  Failed: #{info[:missed]}
     \n#{info[:guessed_word]}
    "
  end

  def clear_screen
    $stdout.clear_screen
  end

  def final_message
    if info[:won]
      "Congrats, you guessed the secret word!👏👏👏"
    else
      "Sorry, you lost. Let me reach you the rope 😜"
    end << "\n\nThe word was #{info[:secret]}."
  end

  public

  def play
    puts "Welcome to The Hangman Game"

    until info[:ended]
      print "Insert your guess: "
      self.info = hangman.take(gets.chomp.downcase)
      clear_screen
      puts match_info
    end

    puts final_message
  end

end

Player.new.play
