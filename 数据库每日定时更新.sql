# 每日0点定时更新数据库sql语句

# 将tb_habits表中的打卡次数全部更新为0
update tb_habits set has_done_times = 0;

# 维护tb_date_habits表，插入所有用户当天的日期的总习惯数，finished_all默认为0
insert into tb_date_records(user_id, habits_count)
select tb_users.user_id, count(description)
from tb_users
         left join habit_developer.tb_habits th on tb_users.user_id = th.user_id
group by tb_users.user_id;

