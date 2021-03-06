class User < ApplicationRecord
  include Permissible

  before_create :encrypt_password
  before_update :encrypt_password
  after_save :clear_password

  has_many :tweets
  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.password= BCrypt::Engine.hash_secret(password, salt)
    else
      self.password = self.password_was
    end
  end

  def clear_password
    self.password = nil
  end

  def permissions
    Permission.joins(:permission_roles).where(permission_roles: { role_id: role_ids })
  end

  def permission_codes
    @_user_permissions_codes ||= permissions.pluck(:code)
  end

  def self.authenticate(username="", login_password="", admin="")
    user = User.find_by(username: username)
    if user && user.match_password(login_password)
      return user
    else
      return false
    end
  end

  def match_password(login_password="")
    password == BCrypt::Engine.hash_secret(login_password, salt)
  end

end