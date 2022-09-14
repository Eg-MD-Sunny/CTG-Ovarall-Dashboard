-----------------------------Mango---------------------------------

select tr.ProductVariantId PVID,pv.Name Product,sum(tr.SalePrice) SaleAmount, count(tr.SalePrice) SaleQuantity

from ThingRequest tr
join Shipment s on s.id=tr.ShipmentId
join ProductVariant pv on pv.Id=tr.ProductVariantId
join ProductVariantCategoryMapping pvcm on pvcm.ProductVariantId=pv.Id
join warehouse w on w.id=s.WarehouseId
where s.ReconciledOn>= '2022-05-05 00:00 +06:00'
and s.ReconciledOn< '2022-05-12 00:00 +06:00'
and s.ReconciledOn is not null
and pvcm.CategoryId = 11
and pv.Name like '%Mango%'
and s.ShipmentStatus not in (1,9,10)
and IsCancelled=0
and IsReturned=0
and HasFailedBeforeDispatch=0
and IsMissingAfterDispatch=0
and w.MetropolitanAreaId=2
and w.distributionnetworkid=1

group by tr.ProductVariantId,pv.Name,datepart(week,cast(dbo.ToBdt(s.ReconciledOn) as Date))
order by 1,2 asc


-----------------------------Soyabeen---------------------------------


select tr.ProductVariantId PVID,pv.Name Product,sum(tr.SalePrice) SaleAmount,count(tr.SalePrice) SaleQuantity

from ThingRequest tr
join Shipment s on s.id=tr.ShipmentId
join ProductVariant pv on pv.Id=tr.ProductVariantId
join ProductVariantCategoryMapping pvcm on pvcm.ProductVariantId=pv.Id
join warehouse w on w.id=s.WarehouseId
where s.ReconciledOn is not null
and s.ReconciledOn>= '2022-05-05 00:00 +06:00'
and s.ReconciledOn< '2022-05-12 00:00 +06:00'
and pvcm.CategoryId = 108
and pv.Name like '%Soyabean%'
and s.ShipmentStatus not in (1,9,10)
and IsCancelled=0
and IsReturned=0
and HasFailedBeforeDispatch=0
and IsMissingAfterDispatch=0
and w.MetropolitanAreaId=2
and w.distributionnetworkid=1

group by tr.ProductVariantId,pv.Name,datepart(week,cast(dbo.ToBdt(s.ReconciledOn) as Date))
order by 1 asc


-----------------------------Beef---------------------------------


select tr.ProductVariantId PVID,pv.Name Product,sum(tr.SalePrice) SaleAmount,count(tr.SalePrice) SaleQuantity

from ThingRequest tr
join Shipment s on s.id=tr.ShipmentId
join ProductVariant pv on pv.Id=tr.ProductVariantId
join ProductVariantCategoryMapping pvcm on pvcm.ProductVariantId=pv.Id
join warehouse w on w.id=s.WarehouseId
where s.ReconciledOn>=  '2022-05-05 00:00 +06:00'
and s.ReconciledOn< '2022-05-12 00:00 +06:00'
and s.ReconciledOn is not null
and pvcm.CategoryId = 25
and pv.Name like '%beef%'
and s.ShipmentStatus not in (1,9,10)
and IsCancelled=0
and IsReturned=0
and HasFailedBeforeDispatch=0
and IsMissingAfterDispatch=0
and w.MetropolitanAreaId=2
and w.distributionnetworkid=1

group by tr.ProductVariantId,pv.Name,datepart(week,cast(dbo.ToBdt(s.ReconciledOn) as Date))
order by 1 asc



-----------------------------Egg---------------------------------


select tr.ProductVariantId PVID,pv.Name Product,sum(tr.SalePrice) SaleAmount,count(tr.SalePrice) SaleQuantity

from ThingRequest tr
join Shipment s on s.id=tr.ShipmentId
join ProductVariant pv on pv.Id=tr.ProductVariantId
join ProductVariantCategoryMapping pvcm on pvcm.ProductVariantId=pv.Id
join warehouse w on w.id=s.WarehouseId
where s.ReconciledOn>= '2022-05-05 00:00 +06:00'
and s.ReconciledOn< '2022-05-12 00:00 +06:00'
and s.ReconciledOn is not null
and pvcm.CategoryId = 61
and s.ShipmentStatus not in (1,9,10)
and IsCancelled=0
and IsReturned=0
and HasFailedBeforeDispatch=0
and IsMissingAfterDispatch=0
and w.MetropolitanAreaId=2
and w.distributionnetworkid=1

group by tr.ProductVariantId,pv.Name,datepart(week,cast(dbo.ToBdt(s.ReconciledOn) as Date))
order by 1 asc
