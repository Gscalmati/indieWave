## Domingo 03/10/2021

- Rediseño de home. *Consultar implementación*.
- Acordamos diseño de Product Detail mobile.
- *Pensar transiciones/animaciones para header.*
- *Consultar por vista "Listado de Productos"*
- Charlamos modificaciones futuras.


## Miércoles 06/10/2021

- Gio se pasó de nashe y agregó un favicon
- Hay que unificar el .css
- Nos quedamos con home 2
- Hay que definir vistas de categoría/productos.
- **Preguntar cómo iniciar nodemon sin argumentos ahora que 'app.js' está en '/src'**


## Miércoles 20/10/2021

- Gio no se acuerda de la contraseña de Heroku
- **Hay que preguntarle a Uri cómo hacemos con Heroku**
- ¿Unimos las rutas de categorias y de id de producto? (/products/:category/:id?) ¿Responderían al mismo método del controlador?
- Revisar labels de formularios create y edit.
- ¿Las rutas en router se leen de arriba a abajo? (caso "products/:category" después de "products/otracosa")

## Domingo 24/10/2021

- **Juani nos quiere meter en una estafa piramidal**
- Juani pone fecha para sus tareas **martes 26/11** 
- Revisamos el dashboard.
- Listados: ¿Le pedimos al user fotos de 'x' tamaño?
- Forms crear y editar: editar/eliminar botones.

## Miércoles 27/10/2021

- **SEAMOS CONSISTENTES CON LOS NOMBRES**

## Domingo 31/10/2021

- Usemos EJS para mostrar juegos destacados y últimos lanzamientos en home.
- Gio nos ghostea.
- COMO CORNO SE ARREGLA LO DEL HTML/BODY? Nos va a romper la vista de category products cuando pongamos wrap a menos que haya **al menos 15 juegos**

## Miércoles 10/11/2021
- Gio arma el nuevo login con validaciones. Ya se puede iniciar sesión, lo cual da acceso al carrito y niega el acceso a logueo y registro.
- El tema de accesos le correspondía a Juani. **Hay que mirar Trello**.
- Juani unifica CSS de forms. Hay que chequear que nada se rompa.
- Facu arma el registro de usuarios. Multer no está funcionando --> **NO SE POR QUÉ CORNO ANTES ANDABA Y AHORA NO PERO AHORA ANDA**
- Gio, más grande que bokita tomando Danonino
- Definimos validaciones para registro de usuario
- **Facu no se acuerda una goma**

## Domingo 14/11/2021
- **A Facu le duele la pancita :,(**
- Implementamos validaciones de registro
- **Gio demuestra su superioridad al detectar errores que nadie ve**
- **Preguntar por validacion name/surname**
- Decidir formato del texto de las validaciones y adaptarlo a mobile
- Juani implementa el chequeo de admin
- **Juani tiene un tema con los typos**
- Juani va a armar la vista de perfil

## Miércoles 17/11/2021
- Arreglamos el tema de session copiando el array con spread
- Juani avanza con profile. Falta responsive.
- **Ordenar css**
- ¿Cómo mantener el formato de los input en autofill?
- Arreglamos name/surname validation

## Domingo 21/11/2021
- Juani ordenó el CSS y avanza con la vista de profile.
- Gio arma la cookie para recordar el usuario. La vamos a terminar cuando tengamos la BD de verdad.
- Elegimos imagen default

## Miércoles 24/11/2021
- Hablamos del tema vacaciones
- Juani añade "Editar Perfil", a implementar con la nueva BD.
- Avanzamos con vista de perfil. 
- **Gio tiene que poner tamaño en px para la foto de perfil en el header**


## Domingo 28/11/2021
- Facu arma vista de error 404 y DB.
- **Los otros dos zánganos se rascaron
- Gio va a tener hecha la data para poblar la DB el miércoles.
- Gio va a **intentar** tener el login Galicia-style para el domingo
- Juani fantasmea el miércoles, pero va a intentar avanzar con sequelize y modelos un poco.
- **Preguntar a Uri por qué hace falta el parámetro "err" para manejar el error 500.**

## Miércoles 01/12/2021
- Arreglamos dbData y dbStructure.
- Facu añade DB ""completa""
- **Hay que poblar la tabla de carritos**
- **Carrito: ¿Precio total?** --> columna "total" en la tabla "carrito" que sume los precios de los productos con los que tiene relacion en "shopping_products"
- **CORROBORAR DB CON LOS PROFES**

## Domingo 01/12/2021
- **Gio fantasmea porque tiene que CEnAr Con SuS PaDrES**
- Gio avanza con nuevo login.
- Juani avanza con Sequelize
- Hay que repartir/asignar lo de CRUD
- Ver como añadir las cosas que no añadimos por tener la base vieja
- **Productos del home clickeables**
- Añadir columna "on_sale" a la tabla de productos

## Miércoles 08/12/2021
- Juani termina modelos y relaciones
- Hay que repartir/asignar lo de CRUD

## Domingo 12/12/2021
- Arreglamos *el impar* de macanas de Juani.
- Gio tiene que armar un script para poblar products_genres.
- Armamos script para fondo de galicia.

## Miércoles 29/12/2021
- Charla post-vacaciones de Juani.
- Gio avanza front y back  validatins de registro.
- **Gio etá felí**
- Repartimos tareas de validaciones.

## Domingo 9/01/2022

- Facu no está, está cazando alfajores en Havanna de MDQ
- Juani avanzó, pero esta perdido.
- Hablamos con Juani sobre las validaciones de Front, arreglamos las referencias a los input y los span
- Gio comenta que el 19 se va de viaje, por ende va a terminar sus tareas del sprint 7 para el miércoles próximo, e intentar comenzar con el sprint 8

## Miércoles 12/01/2022

- Vimos con Juani las validaciones del back end del registro de productos
- Necesitamos solucionar el tema de la "carpeta" a borrar de Multer, cuando hay un error en las validaciones, seguramente #UriQuestion
- Hay que verificar lo avanzado por Facu para concretar la entrega del sprint
- Hay que corregir en base a la devolución de Uri

## Lunes 24/01/2022

- Facu arma API de usuarios. Falta vista de perfil para admin.
- Juani avanza con API de Productos.
- **Rehacer carga de imágenes y exportar base de datos**

## Lunes 26/1/2022

- Facu termina API de usuarios.
- Facu arma proyecto y repo con el dashboard de ejemplo en React.
- Gio vuelve de las vacaciones **(igual en dos día se va de nuevo. Un desastre)**
- Juani arregla las imágenes de los productos que había sumado.

## Lunes 31/01/2022
- Facu añade dos paneles al dashboard React.
- **Hay que sumar logo a todos los productos**

## Lunes 31/01/2022
- Facu añade dos paneles al dashboard React.
- **Hay que sumar logo a todos los productos**

## Miércoles 02/02/2022
- Juani se pone la 10 y añade estilos e imágenes a los productos.
- Arreglamos la clase responsive-img para que las tarjetas de productos y la vista de detalle se vean correctamente.
