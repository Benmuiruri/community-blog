# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post

    return unless user.present?

    can [:read, :update, :destroy], Post, user: user

    return unless user.admin?

   can :manage, Post
  end
end
