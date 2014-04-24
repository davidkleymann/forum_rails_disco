class HomeController < ApplicationController

  def verificated
    verificated = VerificatedUserCommand.new(user_id: params[:id])
    Domain.run_command(verificated)
    flash[:success] = "Der Nutzer mit der ID #{params[:id]} wurde erfolgreich verifiziert!"
    redirect_to user_path(id: 1)
  
  end

end
