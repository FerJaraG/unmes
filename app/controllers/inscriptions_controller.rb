class InscriptionsController < ApplicationController
  before_filter :authenticate_user!

  def pay
  end

  def active
    @user = User.find(current_user.id)
    @course = Course.find(params[:course_id])
    @inscription = Inscription.where(:course => @course, :user => @user).first
    if @inscription.nil?
      @inscription = Inscription.new(:course => @course, :user => @user, :paid => true)
    else
      @inscription.paid = true
    end

    if @inscription.save
      redirect_to(my_courses_courses_path, :notice => "La transacción se ha realizado con éxito")
    else
      redirect_to(my_courses_courses_path, :alert => "La transacción no ha podido ser realizada")
    end
  end

  def create
    @inscription = Inscription.new()
    @course = Course.find(params[:course_id])
    @inscription.user_id = current_user.id
    @inscription.course = @course
    respond_to do |format|
      if @inscription.save
        format.html  { redirect_to(my_courses_courses_path,
              :notice => 'Te has inscrito con éxito :D') }
      else
        format.html  { redirect_to(my_courses_courses_path,
              :notice => 'No hemos podido inscribirte en este curso') }
      end
    end
  end

  private
  def inscriptions_params
    params.require(:inscription).permit()
  end

end
