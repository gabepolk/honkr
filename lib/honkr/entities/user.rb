require 'digest'
require 'pry-byebug'

module Honkr
  class User

    attr_reader :id, :username, :password_digest

    def initialize(id, username, password_digest=nil)
      @id = id
      @username = username
      @password_digest = password_digest
    end

    def update_password(password)
      # TODO: Hash incoming password and save as password digest
      @password_digest = Digest::SHA2.hexdigest(password)
    end

    # binding.pry

    def has_password?(password)
      # TODO: Hash incoming password and compare against own password_digest
      @password_digest == Digest::SHA2.hexdigest(password)
    end
  end
end
