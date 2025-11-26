require 'minitest/autorun'
require_relative '../lib/hangman'

describe 'Testing Hangman class' do
  hangman = Hangman.new
  guessed_word = hangman.choose_secret

  it 'choose_secret must return a string' do
    assert hangman.choose_secret.class.eql?(String)
  end

  it 'choose_secret must return a non-empty string' do
    refute hangman.choose_secret.empty?
  end

  it 'the initial string must only contain the pattern' do
    assert guessed_word.chars.all? do |element|
      element.eql?(Hangman::PATTERN)
    end
  end

  it 'should return a non empty hash after calling take method' do
    user_guess = 'L'
    info = hangman.take(user_guess)

    assert info.class.eql?(Hash)
    refute info.empty?
  end

  it 'should not increase misses if the guess is correct' do
    hangman = Hangman.new
    hangman.choose_secret
    user_guess = 'e'
    expected = {misses: 0, missed: '', guessed: false}
    actual = hangman.take(user_guess)

    assert actual[:misses] == expected[:misses]
    assert actual[:missed] == expected[:missed]
    assert actual[:guessed] == expected[:guessed]
  end

  it 'should increase misses and show missed letters if the guess is wrong' do
    hangman = Hangman.new
    hangman.choose_secret
    user_guess = 'n'
    expected = {misses: 1, missed: 'N', guessed: false}
    actual = hangman.take(user_guess)

    assert actual[:misses] == expected[:misses]
    assert actual[:missed] == expected[:missed]
    assert actual[:guessed] == expected[:guessed]
  end

end
