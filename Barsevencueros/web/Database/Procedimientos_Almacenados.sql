/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  alrod
 * Created: 3/08/2022
 */
/*procedimientos almacenados*/


/*REGISTRAR_PRODUCTO*/

/*iniciar sesion*/
DELIMITER $$
CREATE  PROCEDURE `login`(IN `user_name` VARCHAR(30), IN `user_password` VARCHAR(30))
SELECT * FROM usuario
WHERE usuario_nombre=user_name and usuario_password=user_password$$
DELIMITER ;

/*traer roles*/
DELIMITER $$
CREATE  PROCEDURE `ListaRol`(IN `username` VARCHAR(30))
SELECT usuario.usuario_nombre, rol.tipo_rol FROM rol INNER JOIN usuario ON usuario.id_rolFK = rol.id_rol WHERE usuario.usuario_nombre=username$$
DELIMITER ;

/*nueva mesa*/
DELIMITER $$
CREATE  PROCEDURE `RegistroMesa`(IN `num_mesa` INT, IN `estado` INT)
INSERT INTO `mesa` (`mesa_numero`, `mesa_estado`) VALUES (num_mesa, estado)$$
DELIMITER ;

/*nuevo usuario*/
DELIMITER $$
CREATE PROCEDURE `newUser`(IN `user_name` VARCHAR(30), IN `user_apellido` VARCHAR(30), IN `user_password` INT, IN `user_estado` INT(1), IN `rol_fk` INT(1))
INSERT INTO `usuario` (`usuario_nombre`, `usuario_apellido`, `usuario_password`, `usuario_estado`, `id_rolFK`) 
VALUES (user_name, user_apellido, user_password, user_estado, rol_fk)$$
DELIMITER ;

/*nuevo producto*/
DELIMITER $$
CREATE PROCEDURE `Registrar_Producto`(IN `nom_prod` VARCHAR(30), IN `precio_prod` DOUBLE, IN `prod_estado` INT)
INSERT INTO producto(producto_nombre, producto_precio, producto_estado) VALUES (nom_prod,precio_prod,prod_estado)$$
DELIMITER ;

/*SELECCIONAR PRODUCTOS*/
DELIMITER $$
CREATE PROCEDURE `Select_Productos`()
SELECT * FROM producto$$
DELIMITER ;



