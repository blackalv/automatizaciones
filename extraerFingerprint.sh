##Autor Christian Alvarado##
##Fecha: 05/10/2021##
#Script para obtener los fingerprint de los certificados ssl#
#En la misma carpeta que consta el archivo certificados.txt, se debe colocar el archivo extraerFingerprint.sh#
#este al ejecutarse, arrojará un archivo llamado salida.txt, en donde constan los certificados obtenidos con este script#
#al final de la ejecución nos indicará en la lìnea de comandos si es que hay diferencias o no#

echo "****************INICIANDO******************"
while read line; do
    { echo $line; echo " - " ; echo | openssl s_client -connect $line | openssl x509 -fingerprint -noout; } | tr "\n" ";" >> salida.txt
    echo "\n" >> salida.txt
done < dominios.txt

sed -i 's/SHA1 Fingerprint=//g' "salida.txt"
sed -i 's/;//g' "salida.txt"
sed -i 's/:443//g' "salida.txt"
sed -i 's/:/ /g' "salida.txt"
echo "****************DIFERENCIAS******************"
diff certificados.txt salida.txt
