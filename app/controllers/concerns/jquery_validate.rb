module JqueryValidate
  extend ActiveSupport::Concern

  def check_validation
    @resource = instance_for_validate
    if method_validate_params.keys.any?
      @key = method_validate_params.keys.first
    end
    @resource.valid?
    render html: (@resource.errors[@key].any?) ? 'false' : 'true'
  end

  private

  def instance_for_validate
    if params[:id]
      resource_with_attr_loaded
    else
      current_klass_for_validation.new(method_validate_params)
    end
  end

  def resource_with_attr_loaded
    @resource = resource_load_by_id
    @resource.assign_attributes(method_validate_params)
    @resource
  end

  def resource_load_by_id
    current_klass_for_validation.find_by(id: params[:id]) || current_klass_for_validation.new
  end

  def current_klass_for_validation
    klass = get_name_nested_class.classify.constantize if is_nested_attr?
    klass = controller_name.classify.constantize unless is_nested_attr?
    klass
  end

  def name_loaded_resource
    "#{controller_name.classify.downcase}"
  end

  def method_validate_params
    attr_params = self.send("#{params_key}_params")["#{get_name_nested_attr}"] if is_nested_attr?
    attr_params = self.send("#{name_loaded_resource}_params") unless is_nested_attr?
    attr_params
  end

  def get_name_nested_attr
    params.values[0].keys.first
  end

  def get_name_nested_class
    get_name_nested_attr.split('_')[0]
  end

  def params_key
    params.keys.first
  end

  def is_nested_attr?
    params.values[0].keys.first.include?('attributes')
  end

  include do
    skip_before_filter :authenticate_employee!, only: [:check_validation]
  end

end
