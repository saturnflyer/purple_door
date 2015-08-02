require 'delegate'

class AuthorizedUser < SimpleDelegator
  def can?(permission)
    superuser? || self.permissions.include?(permission.to_s)
  end

  def admin?
    permissions.any?
  end

  def employee?
    permissions.none?
  end
end
