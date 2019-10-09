Para reutilizar la plantilla, basta con eliminar el contenido de hpcap40g.tex, renombrarlo si se quiere y escribir el trabajo de fin de grado que se quiera escribir.

La plantilla está basada en memoir con algunos ajustes adicionales, sobre todo en cuanto a tipo de letra y soporte para varios idiomas. No debería ser difícil de modificar: sólo hay que tocar cosas en epstfg.cls

Si alguien tiene curiosidad, [aquí se puede encontrar el PDF compilado](https://github.com/gjulianm/TFG/blob/master/hpcap40g.pdf) para ver el estilo de la plantilla.

## Algunos consejos

Es mejor compilar el documento con _latexmk_, para que detecte las dependencias automáticamente si hay archivos gnuplot con la extensión _.gp_ (ver [.latexmkrc](https://github.com/gjulianm/TFG/blob/master/.latexmkrc)). Además, se puede ejecutar con _-pvc_ para que compile automáticamente el documento. Así, la línea de compilación debería de ser

```
latexmk -shell-escape -synctex=1 -pdf -silent -interaction=nonstopmode -pvc <archivo .tex>
```
