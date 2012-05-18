require 'rubygems'
require 'sqlite3'

#DAO-class for accessing schedule database
class ScheduleGateway
  attr_accessor :db 
  def get_schedules
    schedules=Array.new
    @db=SQLite3::Database.new( "test.db" )
    @db.results_as_hash=true #allows access using column names
    rows=@db.execute("select * from SCHEDULE") do |row|
      schedules << map_to_object(row)
    end
    
    return schedules
  end
  
  def map_to_object(row)
    schedule=Schedule.new()
    schedule.entry=row['ENTRY']
    schedule.id=row['ID']
    schedule.start_time=row['START_TIME']
    schedule.end_time=row['END_TIME']
    return schedule
  end

end

#DTO for scheduling information
class Schedule
  attr_accessor :id, :entry, :start_time, :end_time
end



