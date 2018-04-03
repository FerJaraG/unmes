class PagesController < ApplicationController

  def home
  	#render :layout => 'landing'
  end

  def involve
  
  end

  def cursos
  end

  def guia
  end
  
  def calendario
  end

  def welcome
  end

  def instalar
  end
  
  def casos
    @casos = [
      {
        :img => 'casos/lsm.png', 
        :project => 'Lean Startup Machine', 
        :name => 'Josefina Canete', 
        :link => 'http://www.lsm.cl'
      }, 
      
      {
        :img => 'casos/wolf.png', 
        :project => 'Wolf Latam', 
        :name => 'Sebastián Parisi',
        :link => 'http://wolflatam.com'
      },

      {
        :img => "casos/kidsstories.png",
        :project => "Kids Stories",
        :name => "Carlos Castillo",
        :link => 'http://www.kidsstories.cl/'
      },

      {
        :img => "casos/kullmer.png",
        :project => "Kullmer-young, joyas de autor",
        :name => "Federico Kunze",
        :link => 'http://kullmer-young.herokuapp.com/'
      },

      {
        :img => "casos/autobroker.png",
        :project => "AutoBroker",
        :name => "Adolfo Mellado",
        :link => 'http://www.autobroker.cl/'
      }

    ]

  end
end
