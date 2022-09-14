-- Current Slot Capecity

select pt.[22] CKT, pt.[24] GEC, pt.[23] MSB
from (
	select dst.WarehouseId WarehouseID,SUM(dst.SlotCapacity) SlotCapacity
	from DeliverySlotTemplate dst 
	join warehouse w on w.id=dst.WarehouseId
	where IsEnabled=1
	and w.Id in (22,23,24)
--	and w.MetropolitanAreaId = 2
	and CAST(dst.[SysEnd] as Date) >= '2022-05-14'
	and CAST(dst.[SysStart] as Date) < '2022-05-15'
	and w.distributionnetworkid=1
	group by dst.WarehouseId,w.name
) dt
PIVOT
(
	sum(SlotCapacity)
	for WarehouseID in ([22],[24],[23])
) pt

--select top 10 * from DeliverySlotTemplate


-- Old Slot Capecity (Run one by one day)

select pt.[22] CKT, pt.[24] GEC, pt.[23] MSB
from (
	select dsth.WarehouseId WarehouseID,SUM(dsth.SlotCapacity) SlotCapacity
	from DeliverySlotTemplate_HISTORY dsth 
	join warehouse w on w.id=dsth.WarehouseId
	where IsEnabled=1
	and w.Id in (22,23,24)
	and CAST(dsth.[SysEnd] as Date) >= '2021-12-27'
	and CAST(dsth.[SysStart] as Date) < '2021-12-28'
--	and w.MetropolitanAreaId = 2
	and dsth.IsEnabled =1
	group by dsth.WarehouseId,w.name
) dt
PIVOT
(
	sum(SlotCapacity)
	for WarehouseID in ([22],[24],[23])
) pt


/* 
For Multiple Date Together

DECLARE @StartDate date 
DECLARE @EndDate date
DECLARE @SlotCapecityDetails table (Date date,CKT int,GEC int, MSB int) -- For Store data

SET @StartDate = '2021-04-01'
SET @EndDate = '2022-01-01'

WHILE ( @StartDate <= @EndDate)
BEGIN
    insert into @SlotCapecityDetails
	-- Main Query
	select @StartDate, pt.[22] CKT, pt.[24] GEC, pt.[23] MSB
	from (
		select dsth.WarehouseId WarehouseID,SUM(dsth.SlotCapacity) SlotCapacity
		from DeliverySlotTemplate_HISTORY dsth 
		join warehouse w on w.id=dsth.WarehouseId
		where IsEnabled=1
		and w.Id in (22,23,24)
		and CAST(dsth.[SysEnd] as Date) >= @StartDate
		and CAST(dsth.[SysStart] as Date) < CONVERT (DATE,(DATEADD(DAY,1,@StartDate)))
	--	and w.MetropolitanAreaId = 2
		and dsth.IsEnabled =1
		group by dsth.WarehouseId,w.name
	) dt
	PIVOT
	(
		sum(SlotCapacity)
		for WarehouseID in ([22],[24],[23])
	) pt
	

    SET @StartDate  = CONVERT (DATE,(DATEADD(DAY,1,@StartDate)))
END
-- Output DataTable
select * from @SlotCapecityDetails Order by 1 desc
*/