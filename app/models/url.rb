class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
  before_create  :shorten
  validates :long_url, :presence => true #:format URI::regexp(%w(http https))

  def shorten
    self.short_url = SecureRandom.base64(5)
  end
end
