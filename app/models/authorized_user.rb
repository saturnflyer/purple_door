require 'delegate'

class AuthorizedUser < SimpleDelegator
  def can?(permission)
    superuser? || self.permissions.include?(permission.to_s)
  end
end
