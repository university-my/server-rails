# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

every 1.day, at: ['9:00 am', '9:00 pm'] do
  runner 'SumduJob.perform_later'
end

every 1.day, at: ['9:02 am', '9:02 pm'] do
  runner 'KpiJob.perform_later'
end

every 1.day, at: ['9:04 am', '9:04 pm'] do
  runner 'KhnueJob.perform_later'
end

every 1.day, at: ['10:00 am', '10:00 pm'] do
  runner 'NuftJob.perform_later'
end

every 1.day, at: ['10:02 am', '10:02 pm'] do
  runner 'PnuJob.perform_later'
end

every 1.day, at: ['10:04 am', '10:04 pm'] do
  runner 'ZnauJob.perform_later'
end

every 1.day, at: ['10:06 am', '10:06 pm'] do
  runner 'SspuJob.perform_later'
end

every 1.day, at: ['10:08 am', '10:08 pm'] do
  runner 'LnuJob.perform_later'
end

every 1.day, at: ['10:10 am', '10:10 pm'] do
  runner 'NuwmJob.perform_later'
end

every 1.day, at: ['10:12 am', '10:12 pm'] do
  runner 'UbsJob.perform_later'
end

every 1.day, at: ['10:14 am', '10:14 pm'] do
  runner 'LdubgdJob.perform_later'
end

every 1.day, at: ['10:16 am', '10:16 pm'] do
  runner 'NungJob.perform_later'
end

every 1.day, at: ['10:20 am', '10:20 pm'] do
  runner 'NpuJob.perform_later'
end

# every 1.day, at: ['10:22 am', '10:22 pm'] do
#   runner 'KtepcKnuteJob.perform_later'
# end

every 1.day, at: ['10:24 am', '10:24 pm'] do
  runner 'UgiJob.perform_later'
end

every 1.day, at: ['10:26 am', '10:26 pm'] do
  runner 'KneuJob.perform_later'
end

every 1.day, at: ['10:28 am', '10:28 pm'] do
  runner 'ZhimJob.perform_later'
end

every 1.day, at: ['10:30 am', '10:30 pm'] do
  runner 'KubgJob.perform_later'
end

every 1.day, at: ['10:32 am', '10:32 pm'] do
  runner 'KmkJob.perform_later'
end

every 1.day, at: ['10:34 am', '10:34 pm'] do
  runner 'VnuJob.perform_later'
end

every 1.day, at: ['10:36 am', '10:36 pm'] do
  runner 'UkuJob.perform_later'
end

every 1.day, at: ['10:38 am', '10:38 pm'] do
  runner 'ChdtuJob.perform_later'
end

every 1.day, at: ['10:40 am', '10:40 pm'] do
  runner 'KarazinJob.perform_later'
end

every 1.day, at: ['10:42 am', '10:42 pm'] do
  runner 'KemkJob.perform_later'
end

every 1.day, at: ['10:44 am', '10:44 pm'] do
  runner 'KtggJob.perform_later'
end

every 1.day, at: ['10:46 am', '10:46 pm'] do
  runner 'KcasJob.perform_later'
end

every 1.day, at: ['10:48 am', '10:48 pm'] do
  runner 'OnmaJob.perform_later'
end

# every 1.day, at: ['10:50 am', '10:50 pm'] do
#   runner 'KmkkovelJob.perform_later'
# end

every 1.day, at: ['10:52 am', '10:52 pm'] do
  runner 'KmkkJob.perform_later'
end

every 1.day, at: ['10:54 am', '10:54 pm'] do
  runner 'ItstepJob.perform_later'
end

# Sitemap refresh
every 1.day, at: '12:00 pm' do
  rake 'sitemap:refresh'
end
