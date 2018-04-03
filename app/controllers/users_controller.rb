class UsersController < ApplicationController
  def pay
  end

  def active
    user = User.find(current_user.id)
    user.paid = true
    user.save!
    redirect_to(my_courses_courses_path, :notice => "La transacción se ha realizado con éxito")
  end
end
