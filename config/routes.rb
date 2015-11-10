require_relative '../app/controllers/demo_controller'
require_relative '../lib/router/router'

class AllRoutes
  def run(router)
    router.draw do
      get gen_rgx(".+"), DemoController, :index
    end
  end
end