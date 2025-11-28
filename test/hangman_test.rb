require 'minitest/autorun'
require_relative '../lib/hangman'

describe 'Testing Hangman class' do
  hangman = Hangman.new
  guessed_word = hangman.choose_secret

  it 'choose_secret must return a string' do
    _(hangman.choose_secret).must_be_instance_of(String)
  end

  it 'choose_secret must return a non-empty string' do
    _(hangman.choose_secret).wont_be_empty
  end

  it 'the initial string must only contain the pattern characters' do
    expected = true
    actual =
      guessed_word.chars.all? do |element|
        element.eql?(Hangman::PATTERN)
      end

    _(actual).must_equal(expected)
  end

  it 'should return a non empty hash after calling take method' do
    user_guess = 'L'
    info = hangman.take(user_guess)

    _(info).must_be_instance_of(Hash)
    _(info).wont_be_empty
  end

  it 'should not increase misses if the guess is correct' do
    hangman = Hangman.new
    hangman.choose_secret
    user_guess = 'e'
    expected = {misses: 0, missed: '', guessed: false}
    actual = hangman.take(user_guess)

    _(actual[:misses]).must_equal(expected[:misses])
    _(actual[:missed]).must_equal(expected[:missed])
    _(actual[:guessed]).must_equal(expected[:guessed])
  end

  it 'should increase misses and show missed letters if the guess is wrong' do
    hangman = Hangman.new
    hangman.choose_secret
    user_guess = 'n'
    expected = {misses: 1, missed: 'N', guessed: false}
    actual = hangman.take(user_guess)

    _(actual[:misses]).must_equal(expected[:misses])
    _(actual[:missed]).must_equal(expected[:missed])
    _(actual[:guessed]).must_equal(expected[:guessed])
  end

end
