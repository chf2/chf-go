require_relative '../app/controllers/demos_controller'
require_relative '../lib/router/router'

class AllRoutes
  def self.run(router)
    router.draw do
      get gen_rgx(""), DemosController, :index
    end
  end
end