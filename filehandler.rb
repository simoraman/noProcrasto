class FileHandler
  def find_line(text)
    
  end
  
  def read(file_name)
    content=[]
    file=File.open(file_name)
    while row=file.gets do
      content << row
    end
    file.close
    return content
  end
    
  def write_line(file_name, text)
    file=File.open(file_name,'a')
    file.puts(text)
    file.close
  end

  def remove_line(file_name,text)
    output=[]
    open(file_name,'r+') do |f|
      while line=f.gets
        if not line.to_s == text+"\n"
          output << line
        end
      end
    end
    
    open(file_name,'w') do |f| 
      f.puts(output)
    end
  end

end




