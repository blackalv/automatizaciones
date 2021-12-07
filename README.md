##Autor blackalv##
##Fecha: 05/10/2021##

Script para obtener los fingerprint de los certificados ssl y con esto automatizar el monitoreo de 
suplantación de los certificados digitales de los sitios institucionales, solicitado en la normativa
seps 103 artículo 20 literal f.

Como ejecutarlo:
- En la misma carpeta deben constar los 3 archivos descargados del repositorio.
- Ejecutar el siguiente comando: sh extraerFingerprint.sh
- Este al ejecutarse, arrojará un archivo llamado salida.txt, en donde constan los certificados obtenidos con este script
- Al final de la ejecución nos indicará en la lìnea de comandos si es que hay diferencias o no
