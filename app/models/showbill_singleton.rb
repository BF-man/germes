require 'singleton'

class Showbill_singleton
  include Singleton

  attr_accessor :text

  def initialize
    @text = "Some default description"
  end

  def update(text)
    text.present? ? @text = text : false
  end

  def text
    @text.present? ? @text : initialize
  end


end