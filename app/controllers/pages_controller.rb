class PagesController < ApplicationController

  SAMPLE_TEXT = 
  "<header>
    <title> Sample Title </title>
  </header>

  <navbar>
    <ul>
      <li>Sample Title 1</li>
      <li>Sample Title 2</li>
    </ul>
  </navbar>

  <footer>
    <a href='#'>First Link</a>
    <a href='#'>Second Link</a>
  </footer>"

  def admin
    @page = Page.first
  end

  def update
    @page = Page.first
    @page.update(update_params)
    redirect_to pages_show_path
  end

  def show
    @page = Page.first
  end

  def compare
    @sample_text = SAMPLE_TEXT
  end

  def compare_sections
    distance = Text::Levenshtein.distance(params[:left_section], params[:right_section]).to_f
    @diff_percentage = calculate_diff(distance)
  end

  private

  def update_params
    params.require(:page).permit(:header, :footer, :navbar).tap do |whitelisted|
      whitelisted[:navbar] = params[:page][:navbar].join(',')
    end
  end

  def string_difference_percent(a, b)
    longer = [a.size, b.size].max
    same = a.each_char.zip(b.each_char).select { |a,b| a == b }.size
    (longer - same) / a.size.to_f
  end

  def calculate_diff(distance)
    return 0 if params[:left_section].length == 0 && params[:right_section].length == 0
    return 100 if params[:left_section].length == 0 && params[:right_section].length > 0
    string_length =  [params[:left_section].length, params[:right_section].length].max 
    distance / string_length * 100
  end
end
