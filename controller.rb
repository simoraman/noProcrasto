require 'filehandler.rb'

class Controller
  private
  attr_accessor :file_handler, :file_name

  public
  def initialize(file_name)
    @file_name=file_name
  end

  #list entries
  def list_entries
    @file_handler=FileHandler.new
    entries=@file_handler.read(@file_name)
    return entries
  end

  #delete entry
  def delete_entry(entry)
    @file_handler=FileHandler.new
    @file_handler.remove_line(@file_name, entry)
  end

#insert entry

#update entry

#add scheduling

#remove scheduling

end
