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
  runner 'PnuService.import_groups'
  runner 'PnuService.import_teachers'
end

every 1.day, at: ['10:04 am', '10:04 pm'] do
  runner 'ZnauService.import_groups'
  runner 'ZnauService.import_teachers'
end

every 1.day, at: ['10:06 am', '10:06 pm'] do
  runner 'SspuService.import_groups'
  runner 'SspuService.import_teachers'
end

every 1.day, at: ['10:08 am', '10:08 pm'] do
  runner 'LnuService.import_groups'
  runner 'LnuService.import_teachers'
end

every 1.day, at: ['10:10 am', '10:10 pm'] do
  runner 'NuwmService.import_groups'
  runner 'NuwmService.import_teachers'
end

every 1.day, at: ['10:12 am', '10:12 pm'] do
  runner 'UbsService.import_groups'
  runner 'UbsService.import_teachers'
end

every 1.day, at: ['10:14 am', '10:14 pm'] do
  runner 'LdubgdService.import_groups'
  runner 'LdubgdService.import_teachers'
end

every 1.day, at: ['10:16 am', '10:16 pm'] do
  runner 'NungService.import_groups'
  runner 'NungService.import_teachers'
end

every 1.day, at: ['10:20 am', '10:20 pm'] do
  runner 'NpuService.import_groups'
  runner 'NpuService.import_teachers'
end

# every 1.day, at: ['10:22 am', '10:22 pm'] do
#   runner 'KtepcKnuteService.perform_now'
# end

every 1.day, at: ['10:24 am', '10:24 pm'] do
  runner 'UgiService.import_groups'
  runner 'UgiService.import_teachers'
end

every 1.day, at: ['10:26 am', '10:26 pm'] do
  runner 'KneuService.import_groups'
  runner 'KneuService.import_teachers'
end

every 1.day, at: ['10:28 am', '10:28 pm'] do
  runner 'ZhimService.import_groups'
  runner 'ZhimService.import_teachers'
end

every 1.day, at: ['10:30 am', '10:30 pm'] do
  runner 'KubgService.import_groups'
  runner 'KubgService.import_teachers'
end

every 1.day, at: ['10:32 am', '10:32 pm'] do
  runner 'KmkService.import_groups'
  runner 'KmkService.import_teachers'
end

every 1.day, at: ['10:34 am', '10:34 pm'] do
  runner 'VnuService.import_groups'
  runner 'VnuService.import_teachers'
end

every 1.day, at: ['10:36 am', '10:36 pm'] do
  runner 'UkuService.import_groups'
  runner 'UkuService.import_teachers'
end

every 1.day, at: ['10:38 am', '10:38 pm'] do
  runner 'ChdtuService.import_groups'
  runner 'ChdtuService.import_teachers'
end

every 1.day, at: ['10:40 am', '10:40 pm'] do
  runner 'KarazinService.import_groups'
  runner 'KarazinService.import_teachers'
end

every 1.day, at: ['10:42 am', '10:42 pm'] do
  runner 'KemkService.import_groups'
  runner 'KemkService.import_teachers'
end

every 1.day, at: ['10:44 am', '10:44 pm'] do
  runner 'KtggService.import_groups'
  runner 'KtggService.import_teachers'
end

every 1.day, at: ['10:46 am', '10:46 pm'] do
  runner 'KcasService.import_groups'
  runner 'KcasService.import_teachers'
end

every 1.day, at: ['10:48 am', '10:48 pm'] do
  runner 'OnmaService.import_groups'
  runner 'OnmaService.import_teachers'
end

# every 1.day, at: ['10:50 am', '10:50 pm'] do
#   runner 'KmkkovelService.perform_now'
# end

every 1.day, at: ['10:52 am', '10:52 pm'] do
  runner 'KmkkService.import_groups'
  runner 'KmkkService.import_teachers'
end

every 1.day, at: ['10:54 am', '10:54 pm'] do
  runner 'ItstepService.import_groups'
  runner 'ItstepService.import_teachers'
end

# Sitemap refresh
every 1.day, at: '12:00 pm' do
  rake 'sitemap:refresh'
end
