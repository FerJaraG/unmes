class LeadsController < InheritedResources::Base
  def new
    @promotional_code = params[:promotional_code]
    super
  end

  def create
    @lead = Lead.new(leads_params)
   
    respond_to do |format|
      if @lead.save
        format.html  { redirect_to(root_path,
              :notice => 'Has postulado con éxito :D') }
      else
        format.html  { render :action => "new" }
      end
    end
  end

  private
  def leads_params
    params.require(:lead).permit(:name, :telephone, :phone, :email)
  end

end
