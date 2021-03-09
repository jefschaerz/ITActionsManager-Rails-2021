module PermissionHelper
    def isAdmin?
      user_signed_in? && current_user.role.downcase ==='admin'
    end
end