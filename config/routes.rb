Rails.application.routes.draw do
  root 'programs#index'
  get ':sort', to: 'programs#index', as: 'sort'
end
