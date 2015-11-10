require_relative '../../lib/controller/controller_base'

class DemosController < ControllerBase
  def index
    p demos_path
  end
end