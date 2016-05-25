# filename: spec/features/support/users_helper

require './lib/pages/users'

def user_1
  @user_1 ||= User.new(
    user_id: 1,
    locale: 'english'
  )
end

def user_2
  @user_2 ||= User.new(
    user_id: 2,
    locale: 'english'
  )
end

def user_3
  @user_3 ||= User.new(
    user_id: 3,
    locale: 'english'
  )
end

def user_4
  @user_4 ||= User.new(
    user_id: 4,
    locale: 'english'
  )
end

def user_fake
  @user_fake ||= User.new(
    user_id: 1234,
    locale: 'english'
  )
end
