select 
factura.id_factura,
factura.fecha_factura as Fecha,
factura.subtotal_factura as subtotal,
factura.iva_factura as iva,
factura.total_factura as total,
sucursal.nombre_sucursal as sucursal,
empleado.id_empleado,
persona.apellidos_persona as Apellidos,
persona.nombres_persona as Nombres,
producto.nombre_producto as producto,
producto.preciio_producto as precio
from detalle_factura
INNER JOIN public.producto on producto.id_producto=detalle_factura.id_producto

INNER JOIN public.factura on factura.id_factura=detalle_factura.id_factura
INNER JOIN public.empleado on empleado.id_empleado=factura.id_empleado
INNER JOIN public.cliente on cliente.id_cliente=factura.id_cliente
INNER JOIN public.persona on persona.id_persona=cliente.id_persona
INNER JOIN public.sucursal on sucursal.id_sucursal=factura.id_sucursal

where factura.id_factura=3;
