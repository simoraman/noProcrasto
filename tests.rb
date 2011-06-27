require 'test/unit'
require 'main.rb'
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

end
