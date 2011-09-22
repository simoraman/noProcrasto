require 'test/unit'
require 'schedule-gateway'

class GateWayTests < Test::Unit::TestCase
  attr_accessor :db, :db_name
  def setup
    @db_name='unittestdb.db'
    @db=SQLite3::Database.new( @db_name )
    sql= <<SQL
     CREATE TABLE SCHEDULE 
     (
     END_TIME TEXT, 
     ENTRY TEXT, 
     ID INTEGER PRIMARY KEY, 
     START_TIME TEXT
     );
    INSERT INTO SCHEDULE(ENTRY, START_TIME, END_TIME)
    VALUES ('http://reddit.com', '08.00', '18.00');
SQL
    @db.execute_batch(sql)
  end

  def teardown
    sql= <<SQL 
DROP TABLE SCHEDULE; 
SQL
    @db.execute_batch(sql)
  end
  
  def test_list
    gw=ScheduleGateway.new(@db_name)
    scheds=gw.get_schedules
    puts 'list: '
    for sch in scheds do
      puts sch.id
      puts sch.entry
      puts sch.start_time
      puts sch.end_time
    end
    puts 'end list: '
  end
  
  def test_insert
    gw=ScheduleGateway.new(@db_name)
    schedule=Schedule.new
    schedule.entry="http://testi.com"
    schedule.start_time='06.00'
    schedule.end_time='16.00'
    gw.save_schedule(schedule)
    puts'row'
    id=@db.execute('select last_insert_rowid()')
    puts id[0]
    #sch=gw.find_schedule_by_id(id[0])
    #puts sch.entry
    test_list
  end
end

