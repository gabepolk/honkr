require 'active_record'

module Honkr
  module Databases
    class SQL
      # Define models and relationships here (yes, classes within a class)
      class User < ActiveRecord::Base
        has_many :honks
        #u = User.create
        # u.posts
        # u.posts.new
      end

      class Honk < ActiveRecord::Base
        belongs_to :user
        #h = Honk.create
        #h.user
        #h.user=
      end

      # Now implement your database methods here
      def persist_honk(honk)
        ar_honk = Honk.create(content: honk.content, user_id: honk.user_id)
        honk.id = ar_honk.id
      end

      def get_honk(honk_id)
        ar_honk = Honk.find_by(id: honk_id)
      end

      def persist_user(user)
        ar_user = User.create(password_digest: user.password_digest, username: user.username)
        user.id = ar_user.id
      end

      def get_user(user_id)
        ar_user = User.find_by(id: user_id)
      end

      def create_user(attrs)
        # NOTE the difference between the two `User` classes.
        # The first inherits from ActiveRecord, while
        # the second is your app's entity class
        ar_user = User.create(attrs)
        MyApp::User.new(ar_user.attributes)
      end

    end
  end
end
