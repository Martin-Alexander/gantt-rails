Rails.application.routes.draw do
  root to: "pages#main"

  post "/save", to: "pages#save", as: "save_tasks"
end
