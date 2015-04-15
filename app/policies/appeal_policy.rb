class AppealPolicy < Struct.new(:user, :post)
  class Scope < Struct.new(:user, :scope)
    # Admins can access all posts on the index view,
    # any other user will only be able to see published ones
    def resolve
      if user.admin?
        scope
      else
        scope.where(:published => true)
      end
    end
  end
end