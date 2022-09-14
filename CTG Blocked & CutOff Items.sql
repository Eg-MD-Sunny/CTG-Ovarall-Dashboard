select pv.id PVID,
	   pv.Name ProductName,
	   pvar.EarliestAvailabilityTime,
	   pvar.AvailabilityCutOffTime,
	   (case when pvar.MarketPurchaseNotGuaranteed=1 then 'Yes' else 'No' end) MarketPurchaseNotGuaranteed,
	   w.Name Warehouse

from ProductVariant pv 
join ProductVariantAvailabilityRestriction pvar on pvar.ProductVariantId=pv.Id
join Warehouse w on pvar.WarehouseId=w.Id
where w.MetropolitanAreaId in (2)

group by pv.id , pv.Name , pvar.EarliestAvailabilityTime, pvar.AvailabilityCutOffTime, pvar.MarketPurchaseNotGuaranteed,w.Name 
order by 1,6 asc