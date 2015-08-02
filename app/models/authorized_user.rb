require 'delegate'

class AuthorizedUser < SimpleDelegator
  def can?(permission)
    superuser? || self.permissions.include?(permission.to_s)
  end

  def admin?
    superuser? || permissions.any?
  end

  def employee?
    !superuser? && permissions.none?
  end
end
