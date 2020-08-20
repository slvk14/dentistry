class UsersController < ApplicationController
  before_action :set_user, except: %i[index create]
  before_action :specify_blueprint, except: %i[destroy]

  def index
    render json: @serializer.render(get_user_type.all, view: :with_appointments)
  end

  def show
    render json: @serializer.render(@record, view: :with_appointments)
  end

  def update
    if @record.update(permitted_params)
      render json: @serializer.render(@record, view: :with_appointments)
    else
      render_custom_error("Unable to update record with id #{params[:id]}")
    end
  end

  def create
    if (record = Mutators::Users::Create.call(permitted_params))
      render json: @serializer.render(record)
    else
      render_custom_error("Unable to create a record with such params")
    end
  end

  def destroy
    if @record.destroy
      render json: {'200' => 'Successfully destroyed'}
    else
      render_custom_error("Unable to destroy the record with id #{params[:id]}")
    end
  end

  private

  def set_user
    return if (@record = get_user_type.find_by(id: params[:id]))

    raise_custom_error("Sorry, #{user_type} with id #{params[:id]} is not found")
  end

  def get_user_type
    user_type.to_s.classify.constantize
  end

  def specify_blueprint
    @serializer = "#{get_user_type}Blueprint".constantize
  end

  def permitted_params
    params.permit(:first_name, :last_name, :email, :password, :age, :description, :type)
  end
end
