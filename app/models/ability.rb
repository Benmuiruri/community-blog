# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post
    can :read, Comment
    return unless user.present?

    can %i[read create update destroy], Post, author: user
    can %i[read create update destroy], Comment, author: user

    return unless user.role === 'admin'

    can :manage, Post
    can :manage, Comment
  end
end
