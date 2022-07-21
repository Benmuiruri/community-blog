# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post

    return unless user.present?

    can %i[read create update destroy], Post, author: user

    return unless user.role === 'admin'

    can :manage, Post
  end
end
