require 'test/unit'
require 'filehandler.rb'
require 'controller.rb'

class Tests < Test::Unit::TestCase
  attr_accessor :file_name

  def setup
    @file_name='fileTest.txt'
    @file=File.open(@file_name,'w+')
    @file << "string\n"
    @file << "string2\n"
    @file << "string3\n"
    @file.close    
  end

  def teardown
    File.delete(@file_name)
  end

  def test_add_line
    fh=FileHandler.new
    content=fh.read(@file_name)
    assert(!content.include?("string4\n"))
    fh.write_line(@file_name,'string4')
    content=fh.read(@file_name)
    assert(content.include?("string4\n"),'should be true')
  end

  def test_delete_line
    fh=FileHandler.new
    content=fh.read(@file_name)
    assert(content.include?("string2\n"))
    fh.remove_line(@file_name,"string2")
    content=fh.read(@file_name)
    assert(!content.include?("string2\n"))
  end

  def test_controller_list_entries
    controller=Controller.new(@file_name)
    entries=controller.list_entries
    assert(entries.include?("string\n"))
    assert(entries.include?("string2\n"))
    assert(entries.include?("string3\n"))
  end

  def test_controller_delete_entry
    controller=Controller.new(@file_name)
    entries=controller.list_entries
    assert(entries.include?("string2\n"))
    controller.delete_entry("string2")
    entries=controller.list_entries
    assert(!entries.include?("string2\n"))
  end
end
