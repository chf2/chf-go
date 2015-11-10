require_relative '../lib/controller_base'
require_relative '../app/controllers/api/moments_controller'
require_relative '../app/controllers/static_pages_controller'
require_relative '../lib/router'

class AllRoutes
  def initialize
    @collection = []
  end

  def run(router)
    router.draw do
      get gen_rgx(".+"), DemoController, :index
    end
  end

end