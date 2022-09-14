select top 25 cast(dbo.ToBdt(s.ReconciledOn) as Date) [Date],
	   tr.ProductVariantId PVID,
	   pv.Name ProductName,
	   sum(tr.SalePrice) SaleAmount,
	   count(tr.SalePrice) SaleQuantity


from ThingRequest tr
join Shipment s on s.Id=tr.ShipmentId
join Warehouse w on w.id=s.WarehouseId
join ProductVariant pv on pv.id=tr.ProductVariantId
where s.ReconciledOn is not null
and s.ReconciledOn>= '2022-05-21 00:00 +06:00'
and s.ReconciledOn< '2022-05-22 00:00 +06:00'
and s.ShipmentStatus not in (1,9,10)
and IsCancelled=0
and IsReturned=0
and HasFailedBeforeDispatch=0
and IsMissingAfterDispatch=0
and w.MetropolitanAreaId in (2)
and pv.name not like '%gift from chaldal%'
and w.distributionnetworkid=1

group by cast(dbo.ToBdt(s.ReconciledOn) as Date),tr.ProductVariantId, pv.Name
order by 5 desc