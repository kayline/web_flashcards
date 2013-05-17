require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  has_many :rounds
  has_many :decks, :through => :rounds

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    @user = User.find_by_email(email)
    if @user.password == password
      @user
    else
      @errors = User.errors.full_messages 
    end
  end


end

