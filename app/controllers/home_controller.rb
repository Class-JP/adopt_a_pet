class HomeController < ApplicationController

  def index
    # @page_name = ['Adopt a Pet!', 'Foo', 'Bar']
    @page_name = 'Adopt a Pet!'
    # @students = ['Kevin', 'Jeff', 'Alexa', 'Susana', 'Jordy', 'Deynor']
    @students = [
      {id: 1, name: 'Kevin'},
      {id: 2, name: 'Jordy'},
      {id: 3, name: 'Susana'},
      {id: 4, name: 'Adiel'}
    ]
  end

  def about
    render template: 'home/about_page'
  end

  def matriculas
    # @matricula = Matricula.where(year: 2023)
    @matricula = {
      year: 2023,
      period: '1st quarter',
      courses: ['POO', 'BDs', 'Funtadamentos WEB'],
      embeded_students: [
        {id: 1, name: 'Kevin'},
        {id: 2, name: 'Jordy'},
        {id: 3, name: 'Susana'},
        {id: 4, name: 'Adiel'}
      ]
    }
  end
end
