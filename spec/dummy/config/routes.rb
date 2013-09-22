Rails.application.routes.draw do

  mount InstaSubscriber::Engine => "/timezoner"
end
