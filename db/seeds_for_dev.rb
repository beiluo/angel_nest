require File.dirname(__FILE__) + '/../spec/support/blueprints'

p 'Creating seeds data for development ...'

2.times do
  user = User.make!
  user.confirm!

  5.times do
    Message.make!(:user => user)
  end
end

user  = User.first
user2 = User.last

user.follow(user2)
user.send_private_message(user2, 'hey there!')
user2.send_private_message(user, 'what up?')

user2.investor = Investor.make!

startup = Startup.make!
startup.attach_user(user, :founder)

p 'Finished creating seeds data for development.'