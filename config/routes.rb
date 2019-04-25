Rails.application.routes.draw do
  root to: 'login#index'

  get 'complete/index'

  post 'complete/index'

  get 'passwordnew/index'

  get 'passwordresend/index'

  post 'passwordresend/sousin'

  get 'ordernew/index'
  post 'ordernew/update'

  get 'orderedit/index'
  post 'orderedit/update'

  get 'order/index'
  get 'order/delete'

  get 'loginafter/index'

  post 'loginafter/index'

  get 'login/index'

  post 'login/index'

  post 'login/check'

  get 'top/index'

  get 'top/check'

  get 'calendar/index'

  get 'ordering/index'

  get 'ordering/edit'

  get 'ordering/update'

  get 'ordering/delete'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
