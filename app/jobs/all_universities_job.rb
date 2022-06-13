class AllUniversitiesJob < ApplicationJob
  queue_as :default
  
  def perform(*args)
    SumduService.import_teachers
    SumduService.import_groups
    SumduService.import_auditoriums

    # KpiService.import_groups
    # KpiService.import_teachers

    KhnueService.import_teachers
    KhnueService.import_groups
    KhnueService.import_auditoriums

    NuftService.import_groups
    NuftService.import_teachers

    PnuService.import_groups
    PnuService.import_teachers

    ZnauService.import_groups
    ZnauService.import_teachers

    SspuService.import_groups
    SspuService.import_teachers

    LnuService.import_groups
    LnuService.import_teachers

    NuwmService.import_groups
    NuwmService.import_teachers

    UbsService.import_groups
    UbsService.import_teachers

    LdubgdService.import_groups
    LdubgdService.import_teachers

    NungService.import_groups
    NungService.import_teachers

    NpuService.import_groups
    NpuService.import_teachers

    UgiService.import_groups
    UgiService.import_teachers

    # KneuService.import_groups
    # KneuService.import_teachers

    ZhimService.import_groups
    ZhimService.import_teachers

    KubgService.import_groups
    KubgService.import_teachers

    KmkService.import_groups
    KmkService.import_teachers

    VnuService.import_groups
    VnuService.import_teachers

    UkuService.import_groups
    UkuService.import_teachers

    ChdtuService.import_groups
    ChdtuService.import_teachers

    KarazinService.import_groups
    KarazinService.import_teachers

    KemkService.import_groups
    KemkService.import_teachers

    KtggService.import_groups
    KtggService.import_teachers

    KcasService.import_groups
    KcasService.import_teachers

    OnmaService.import_groups
    OnmaService.import_teachers

    KmkkService.import_groups
    KmkkService.import_teachers

    ItstepService.import_groups
    ItstepService.import_teachers
  end
  
end
