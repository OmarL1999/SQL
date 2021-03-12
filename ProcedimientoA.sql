create or replace function obtener_total_sucursal(in nombre_sucursal varchar,
												  out total_facturas varchar
												  )
as $BODY$
begin 
select sum(factura.total_factura) into total_facturas
from factura
inner join public.sucursal on sucursal.id_sucursal=factura.id_sucursal
where nombre_sucursal=nombre_sucursal;
end
$BODY$
language plpgsql
/*
select * from obtener_total_sucursal('SuperLibertad')
*/
