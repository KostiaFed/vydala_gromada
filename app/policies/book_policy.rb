# frozen_string_literal: true

class BookPolicy < ApplicationPolicy
  def show?
    true
  end

  def edit?
    owner?
  end

  private

  def owner?
    user == record.user
  end
end
