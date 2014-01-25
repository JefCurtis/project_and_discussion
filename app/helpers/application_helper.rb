module ApplicationHelper

  def formatted_date(date)
    date.strftime("%d-%m-%y, %l:%M %P")
  end

  def truncate_sentence(string)
     string.truncate(200, ommission: ("....."))
 end

end
