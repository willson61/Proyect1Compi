# Proyecto #1 - Compiladores

## Funcionamiento
El programa se basa en un Jframe con 4 botones y 1 label para la seleccion del archivo de entrada, la generacion del archivo Lexer.java y para el analisis de dicho archivo de entrada. A continuacion esta una descripcion de cada uno de estos elementos del JFrame:
- Boton Buscar Entrada: Al presionar este boton se abrira una instancia del explorador de archivos de windows para la busqueda del archivo de entrada. Es importante recalcar que esta instancia solo permitira la seleccion de archivos con la extension ".txt". Despues de haber seleccionado el archivo aparecera la direccion del archivo seleccionado en un label justo debajo de este boton y podra ver que se ha habilitado la opcion de utilizar el boton de Analizar Entrada.
- Boton Borrar Entrada: EN caso de que se haya seleccionado el archivo equivocado se puede utilizar este boton. Al presionarlo se borrara la direccion guardada en el label, se le permitira seleccionar otra vez el boton de Buscar Entrara, y se deshabilitara el boton de Analizar Entrada.
- Boton Generar Lexer: Al presionar este boton se generara el archivo Lexer.java dentro del paquete Code del proyecto a partir del archivo con extension .flex que se ha creado previamente dentro del proyecto.
- Boton Analizar Entrada: Al presionar este boton despues de haber seleccionado un archivo se analizara el contenido del archivo en busca de expresiones que coincidan con las determinadas en los tokens del archivo ".flex". Cuando termine el analisis el programa generara un archivo con la extension .out en la carpeta del proyecto que contiene todas las expresiones identificadas dentro del archivo de entrada y los errores identificados. 

## Caracteristicas y Comentarios
- En mi opinion mi programa funciona correctamente gracias a los ejemplos que investigue, al manual de jflex y a las pruebas que realize. Puede que no haya realizado suficientes pruebas por motivos presonales y de tiempo pero estoy seguro de que el funcionamiento basico esta correcto.
- Es importante informar que el programa dara error si se sigen los siguientes pasos:
  1. Si no se ha generado el archivo lexer.java dentro del proyecto
  2. Se genera el archivo lexer.java utilizando el boton Generar Lexer
  3. Se selecciona un archivo para analizzar y se selecciona el boton Analizar Entrada
  
  Para evitar este error despues de haber generado el archivo lexer.java cierre el programa y vuelvalo a iniciar. Y despues seleccione un 
  archivo y seleccione Analizar Entrada. Otra forma de evitar este error si no se ha generado la clase lexer.java antes de inicar el 
  programa es ejecutando la clase Principal.java que se encuentra dentro del proyecto antes de correr el programa. Esta clase cumple la
  misma funcion del boton Generar Lexer.
