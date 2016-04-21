require './lib/pages/users'

def user_1
  @user_1 ||= User.new(
    user_id: 1,
  )
end
