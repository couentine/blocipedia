class WikiPolicy < ApplicationPolicy
  attr_reader :wiki

  def initialize(user, wiki)
    super(user, wiki)
    @wiki = record
  end
  def update?
    user.admin? || wiki.user == user
  end
end