# filename: spec/features/support/users_helper

require './lib/pages/users'

def user_1
  @user_1 ||= Users.new(
    user_id: 1,
    locale: 'english'
  )
end

def user_2
  @user_2 ||= Users.new(
    user_id: 2,
    locale: 'english'
  )
end

def user_3
  @user_3 ||= Users.new(
    user_id: 3,
    locale: 'english'
  )
end

def user_4
  @user_4 ||= Users.new(
    user_id: 4,
    locale: 'english'
  )
end

def user_fake
  @user_fake ||= Users.new(
    user_id: 1234,
    locale: 'english'
  )
end
