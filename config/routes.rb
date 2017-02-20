Rails.application.routes.draw do
  # get 'pages/admin'
  # post 'pages/update'
  # get 'pages/show'
  get 'pages/compare'
  post 'pages/compare_sections'

  root to: 'pages#compare'
end
