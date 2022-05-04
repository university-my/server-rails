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

# Blazer checks

every 1.hour do
  rake blazer:run_checks
end

# Universities

every 1.day, at: ['9:00 am', '9:00 pm'] do
  runner 'SumduService.import_teachers'
  runner 'SumduService.import_groups'
  runner 'SumduService.import_auditoriums'
end

every 1.day, at: ['9:02 am', '9:02 pm'] do
  runner 'KpiService.import_groups'
  runner 'KpiService.import_teachers'
end

every 1.day, at: ['9:04 am', '9:04 pm'] do
  runner 'KhnueService.import_teachers'
  runner 'KhnueService.import_groups'
  runner 'KhnueService.import_auditoriums'
end

every 1.day, at: ['10:00 am', '10:00 pm'] do
  runner 'NuftService.import_groups'
  runner 'NuftService.import_teachers'
end

every 1.day, at: ['10:02 am', '10:02 pm'] do
  runner 'PnuJob.import_groups'
  runner 'PnuJob.import_teachers'
end

every 1.day, at: ['10:04 am', '10:04 pm'] do
  runner 'ZnauJob.import_groups'
  runner 'ZnauJob.import_teachers'
end

every 1.day, at: ['10:06 am', '10:06 pm'] do
  runner 'SspuJob.import_groups'
  runner 'SspuJob.import_teachers'
end

every 1.day, at: ['10:08 am', '10:08 pm'] do
  runner 'LnuJob.import_groups'
  runner 'LnuJob.import_teachers'
end

every 1.day, at: ['10:10 am', '10:10 pm'] do
  runner 'NuwmJob.import_groups'
  runner 'NuwmJob.import_teachers'
end

every 1.day, at: ['10:12 am', '10:12 pm'] do
  runner 'UbsJob.import_groups'
  runner 'UbsJob.import_teachers'
end

every 1.day, at: ['10:14 am', '10:14 pm'] do
  runner 'LdubgdJob.import_groups'
  runner 'LdubgdJob.import_teachers'
end

every 1.day, at: ['10:16 am', '10:16 pm'] do
  runner 'NungJob.import_groups'
  runner 'NungJob.import_teachers'
end

every 1.day, at: ['10:20 am', '10:20 pm'] do
  runner 'NpuJob.import_groups'
  runner 'NpuJob.import_teachers'
end

# every 1.day, at: ['10:22 am', '10:22 pm'] do
#   runner 'KtepcKnuteJob.perform_now'
# end

every 1.day, at: ['10:24 am', '10:24 pm'] do
  runner 'UgiJob.import_groups'
  runner 'UgiJob.import_teachers'
end

every 1.day, at: ['10:26 am', '10:26 pm'] do
  runner 'KneuJob.import_groups'
  runner 'KneuJob.import_teachers'
end

every 1.day, at: ['10:28 am', '10:28 pm'] do
  runner 'ZhimJob.import_groups'
  runner 'ZhimJob.import_teachers'
end

every 1.day, at: ['10:30 am', '10:30 pm'] do
  runner 'KubgJob.import_groups'
  runner 'KubgJob.import_teachers'
end

every 1.day, at: ['10:32 am', '10:32 pm'] do
  runner 'KmkJob.import_groups'
  runner 'KmkJob.import_teachers'
end

every 1.day, at: ['10:34 am', '10:34 pm'] do
  runner 'VnuJob.import_groups'
  runner 'VnuJob.import_teachers'
end

every 1.day, at: ['10:36 am', '10:36 pm'] do
  runner 'UkuJob.import_groups'
  runner 'UkuJob.import_teachers'
end

every 1.day, at: ['10:38 am', '10:38 pm'] do
  runner 'ChdtuJob.import_groups'
  runner 'ChdtuJob.import_teachers'
end

every 1.day, at: ['10:40 am', '10:40 pm'] do
  runner 'KarazinJob.import_groups'
  runner 'KarazinJob.import_teachers'
end

every 1.day, at: ['10:42 am', '10:42 pm'] do
  runner 'KemkJob.import_groups'
  runner 'KemkJob.import_teachers'
end

every 1.day, at: ['10:44 am', '10:44 pm'] do
  runner 'KtggJob.import_groups'
  runner 'KtggJob.import_teachers'
end

every 1.day, at: ['10:46 am', '10:46 pm'] do
  runner 'KcasJob.import_groups'
  runner 'KcasJob.import_teachers'
end

every 1.day, at: ['10:48 am', '10:48 pm'] do
  runner 'OnmaJob.import_groups'
  runner 'OnmaJob.import_teachers'
end

# every 1.day, at: ['10:50 am', '10:50 pm'] do
#   runner 'KmkkovelJob.perform_now'
# end

every 1.day, at: ['10:52 am', '10:52 pm'] do
  runner 'KmkkJob.import_groups'
  runner 'KmkkJob.import_teachers'
end

every 1.day, at: ['10:54 am', '10:54 pm'] do
  runner 'ItstepJob.import_groups'
  runner 'ItstepJob.import_teachers'
end

# Sitemap refresh
every 1.day, at: '12:00 pm' do
  rake 'sitemap:refresh'
end
