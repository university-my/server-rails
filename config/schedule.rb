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

every 1.day, at: '1:00 am' do
  runner 'SumduJob.perform_now'
end

every 1.day, at: '1:02 am' do
  runner 'KhnueJob.perform_now'
end

every 1.day, at: '1:03 am' do
  runner 'NuftJob.perform_now'
end

every 1.day, at: '1:04 am' do
  runner 'PnuJob.perform_now'
end

every 1.day, at: '1:05 am' do
  runner 'ZnauJob.perform_now'
end

every 1.day, at: '1:06 am' do
  runner 'SspuJob.perform_now'
end

every 1.day, at: '1:07 am' do
  runner 'LnuJob.perform_now'
end

every 1.day, at: '1:08 am' do
  runner 'NuwmJob.perform_now'
end

every 1.day, at: '1:09 am' do
  runner 'UbsJob.perform_now'
end

every 1.day, at: '1:10 am' do
  runner 'LdubgdJob.perform_now'
end

every 1.day, at: '1:11 am' do
  runner 'NungJob.perform_now'
end

every 1.day, at: '1:12 am' do
  runner 'NpuJob.perform_now'
end

# every 1.day, at: ['10:22 am', '10:22 pm'] do
#   runner 'KtepcKnuteService.perform_now'
# end

every 1.day, at: '1:13 am' do
  runner 'UgiJob.perform_now'
end

every 1.day, at: '1:14 am' do
  runner 'KneuJob.perform_now'
end

every 1.day, at: '1:15 am' do
  runner 'ZhimJob.perform_now'
end

every 1.day, at: '1:16 am' do
  runner 'KubgJob.perform_now'
end

every 1.day, at: '1:17 am' do
  runner 'KmkJob.perform_now'
end

every 1.day, at: '1:18 am' do
  runner 'VnuJob.perform_now'
end

every 1.day, at: '1:19 am' do
  runner 'UkuJob.perform_now'
end

every 1.day, at: '1:20 am' do
  runner 'ChdtuJob.perform_now'
end

every 1.day, at: '1:21 am' do
  runner 'KarazinJob.perform_now'
end

every 1.day, at: '1:22 am' do
  runner 'KemkJob.perform_now'
end

every 1.day, at: '1:23 am' do
  runner 'KtggJob.perform_now'
end

every 1.day, at: '1:24 am' do
  runner 'KcasJob.perform_now'
end

every 1.day, at: '1:25 am' do
  runner 'OnmaJob.perform_now'
end

# every 1.day, at: ['10:50 am', '10:50 pm'] do
#   runner 'KmkkovelService.perform_now'
# end

every 1.day, at: '1:26 am' do
  runner 'KmkkJob.perform_now'
end

every 1.day, at: '1:27 am' do
  runner 'ItstepJob.perform_now'
end

every 1.day, at: '2:00 am' do
  runner 'KpiJob.perform_now'
end

# Sitemap refresh
every 1.day, at: '12:00 pm' do
  rake 'sitemap:refresh'
end
