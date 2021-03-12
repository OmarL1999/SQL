do $$
declare 
       registro record;
	   año cursor for select 
	       factura.id_factura as Codigo,
	       factura.total_factura as Total,
		   factura.fecha_factura as Fecha,
		   empleado.id_empleado as Empleado,
		   sucursal.nombre_sucursal as Sucursal,
		   (persona.nombres_persona || ' ' ||  persona.apellidos_persona) AS Cliente
		   from factura
		   INNER JOIN public.empleado on empleado.id_empleado=factura.id_empleado
		   INNER JOIN public.sucursal on sucursal.id_sucursal=factura.id_sucursal
		   INNER JOIN public.cliente on cliente.id_cliente=factura.id_cliente
		   INNER JOIN public.persona on persona.id_persona=cliente.id_persona
		   where factura.fecha_factura between '2020-01-01' and '2020-12-31';
begin 
for registro in año loop
raise notice 'Factura: %, Sucursal:%, Fecha:%, Empleado:%, Cliente:%, Total:% ',
registro.Codigo, registro.Sucursal, registro.Fecha, registro.Empleado, registro.Cliente, registro.Total;
end loop;
end $$
language 'plpgsql'
