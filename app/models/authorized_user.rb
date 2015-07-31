require 'delegate'

class AuthorizedUser < SimpleDelegator
  def can?(permission)
    self.permissions.include?(permission)
  end
end
