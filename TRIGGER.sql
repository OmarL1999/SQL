create or replace function tg_aviso_stock() returns trigger
as 
$tg_aviso_stock$
  declare 
   stock int;
begin 
     select  STOCK_PRODUCTO into stock from producto where producto.id_producto=new.id_producto;
	 if(stock<=50) then
	 raise notice  'Ingrese mas productos al stock'
	 end if;
end;
$tg_aviso_stock$
language plpgsql;


create trigger tg_validacionstock before insert
on detalle_factura for each row
execute procedure tg_aviso_stock();

/*
INSERT INTO detalle_factura (ID_DETFAC, 
							 ID_PRODUCTO, 
							 ID_FACTURA) VALUES
                             (6, 7, 2);
*/
