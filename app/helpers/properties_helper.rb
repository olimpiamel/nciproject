module PropertiesHelper

  def current_property
    @property = Property.find(params[:property_id])
  end

end
