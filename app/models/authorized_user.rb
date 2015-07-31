require 'delegate'

class AuthorizedUser < SimpleDelegator
  def can?(permission)
    superuser? || self.permissions.include?(permission)
  end
end
