<?xml version="1.0" encoding="UTF-8"?>
<!--
	===============================
	Lenguajes de Marcas
	Bloque 3, tarea 6
	Alumno: Amadeo Penella Santarremigia
	===============================
	  
  + Mostramos titulo y subtítulo <h1> y <h2>
    
  + Añadimos algunos formatos a la tabla, como el ancho con respecto a la ventana que la contiene (width="60%")
    
  + Añadimos instrucciones template para utilizar plantillas en cada nivel (path, cds, cd y nodos terminales: anyo, estilo, titulo, interprete, precio, num_canciones)
    
  + Anidamos una tabla dentro de otra creando un efecto marco
    
  + Añadimos la columna Nº de canciones al final de la tabla, el resto ya las teníamos de tareas anteriores
    
  + En esta ocasión mostramos los resultados de las filas en orden descendente por año en la plantilla de nivel "cds" para aplicar en la plantilla "cd"
    
  + Uilizamos la estrutura choose, con un when para la condicion de precio num_canciones > 10 mostrar en rojo.
  Para el resto de posibilidades utilizamos otherwise, en este caso num_canciones=< 10 mostrar en verde
    
	-->
	
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/"> <!-- abrimos plantilla nivel raíz-->
  <html>
    <body>
      <h1> - CDTECA - </h1>
      <xsl:apply-templates/>
    </body>
  </html>
  </xsl:template> <!-- cerramos la plantilla nivel raíz -->
  <xsl:template match="cds"> <!-- abrimos la plantilla nivel 1 (cds) -->
      <h2>Mi colección de CDs</h2> <!-- añadimos el subtitulo como un segundo head-->
      <table border="0" width="60%" bgcolor="#000000" cellspacing="3" cellpadding="5"> <!-- Definimos algunas propiedades estéticas de la tabla, separación entre celdas, ancho total respecto a la ventana, lineas de celda
            y espacio alrededor del contenido de la celda-->
          <tr>
            <td>
              <table border="5" width="100%" cellpadding="4" > <!-- anidamos la tabla dentro de otra tabla, de esta manera podemos mostrar un efecto tipo marco alrededor de la misma-->
                <tr bgcolor="#B532B5" ><!--cambiamos el color de la cabecera-->
                  <th>Año</th> <!-- añadimos la columna Año-->
                  <th>Estilo</th>
                  <th>Título</th>
                  <th>Intérprete</th>
                  <th>Precio en €</th> <!-- añadimos la columna Precio en €-->
                  <th>Nº Canciones</th> <!-- añadimos la columna Nº Canciones al final de la tabla-->
                </tr>
                <xsl:apply-templates select="cd">
                  <xsl:sort select="anyo" order="descending"/> <!-- mostraremos los datos de la tabla del nivel cd ordenados por año de mayor a menor-->
                </xsl:apply-templates>
              </table>
            </td>
          </tr>
      </table>
  </xsl:template> <!-- cerramos la plantilla de nivel 1 (cds)-->
  <xsl:template match="cd"> <!-- abrimos la plantilla de nivel 2 (cd)-->
            <xsl:choose> <!-- creamos en esta plantilla la estructura xsl:choolse, que nos permitirá cambiar el formatio según al condición num_canciones para esta tarea -->
              <xsl:when test="num_canciones &gt; 10"> <!-- si el precio es mayor de 25 euros, mostraremos los resultados de esta forma: color rojo -->
              <tr bgcolor="#ff0000" align="center"> <!-- definimos el color rojo y la alineación centrada para esta condición -->
                <td><xsl:apply-templates select="anyo"/></td>
                <td><xsl:apply-templates select="estilo"/></td>
                <td><xsl:apply-templates select="titulo"/></td>
                <td><xsl:apply-templates select="interprete"/></td>
                <td><xsl:apply-templates select="precio"/></td>
                <td><xsl:apply-templates select="num_canciones"/></td>
              </tr>
              </xsl:when> <!-- cerramos la primera condición-->
              <xsl:otherwise> <!-- como solo hay una condición el resto que no la cumplan la consideraremos otherwise (num_canciones <=10)-->
              <tr bgcolor="#00ff00" align="center"> <!-- para los que no cumplen la condición definimos color verde y alineación centrada)  -->
                <td><xsl:apply-templates select="anyo"/></td>
                <td><xsl:apply-templates select="estilo"/></td>
                <td><xsl:apply-templates select="titulo"/></td>
                <td><xsl:apply-templates select="interprete"/></td>
                <td><xsl:apply-templates select="precio"/></td>
                <td><xsl:apply-templates select="num_canciones"/></td>
              </tr>
              </xsl:otherwise> <!-- cerramos otherwise-->
            </xsl:choose> <!-- cerramos choose-->
  </xsl:template> <!-- cerramos la plantilla de nivel 2-->
        <xsl:template match="anyo"> <!-- añadimos las plantillas de los nodos terminales que simplemente seguirán las plantilla definida en el nivel anterior (cd)-->
        <td><xsl:value-of select="."/></td> 
        </xsl:template>
        <xsl:template match="estilo">
        <td><xsl:value-of select="."/></td> 
        </xsl:template>
        <xsl:template match="titulo">
        <td><xsl:value-of select="."/></td> 
        </xsl:template>
        <xsl:template match="interprete">
        <td><xsl:value-of select="."/></td> 
        </xsl:template>
        <xsl:template match="precio">
        <td><xsl:value-of select="."/></td> 
        </xsl:template>
        <xsl:template match="num_canciones">
        <td><xsl:value-of select="."/></td> 
        </xsl:template>
</xsl:stylesheet> <!-- cerramos la hoja de estilo-->
