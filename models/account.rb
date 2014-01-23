class Account < ActiveRecord::Base
# app/models/account.rb
  def self.create_with_omniauth(auth)
    create! do |account|
      account.provider = auth["provider"]
      account.uid      = auth["uid"]
      account.email    = auth["name"]
      account.email    = auth["user_info"]["email"] if auth["user_info"] # we get this only from FB
      account.role     = "users"
    end
  end
end
