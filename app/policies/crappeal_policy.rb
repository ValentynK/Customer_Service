class CrappealPolicy < ApplicationPolicy
  class Scope < Scope
    # attr_reader :user, :scope

   # def initialize(user, scope)
    #  @user = user
     # @scope = scope
    # end

    def resolve
      if user.admin?
        scope.all
      else
        scope.where(:published => true)
      end
    end
  end

  def update?
    user.admin? or not record.published?
  end

  def permitted_attributes
    if user.admin? || user.owner_of?(scope)
      [:name, :email, :issue_type, :title, :text] # :tag_list]
    else
      return # [:tag_list]
    end
  end
end