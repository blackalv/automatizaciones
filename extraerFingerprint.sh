##Autor Christian Alvarado##
##Fecha: 05/10/2021##
#Script para obtener los fingerprint de los certificados ssl#
#En la misma carpeta que consta el archivo certificadosJEP.txt, se debe colocar el archivo extraerFingerprint.sh#
#este al ejecutarse, arrojará un archivo llamado salida.txt, en donde constan los certificados obtenidos con este script#
#al final de la ejecución nos indicará en la lìnea de comandos si es que hay diferencias o no#


{ echo "jep.coop - " ; echo | openssl s_client -connect www.jep.coop:443 | openssl x509 -fingerprint -noout; } | tr "\n" ";" >> salida.txt
echo "\n" >> salida.txt
{ echo "tarjetasjep - " ; echo | openssl s_client -connect www.tarjetasjep.com:443 | openssl x509 -fingerprint -noout; } | tr "\n" ";" >> salida.txt
echo "\n" >> salida.txt
{ echo "jeprecompensas - " ; echo | openssl s_client -connect www.jeprecompensas.com:443 | openssl x509 -fingerprint -noout; } | tr "\n" ";" >> salida.txt
echo "\n" >> salida.txt
{ echo "jepvirtual - " ; echo | openssl s_client -connect jepvirtual.jep.coop:443 | openssl x509 -fingerprint -noout; } | tr "\n" ";" >> salida.txt
echo "\n" >> salida.txt
{ echo "movil - " ; echo | openssl s_client -connect movil.jep.coop:443 | openssl x509 -fingerprint -noout; } | tr "\n" ";" >> salida.txt
echo "\n" >> salida.txt
{ echo "contactcenter - " ; echo | openssl s_client -connect contactcenter.coopjep.fin.ec:443 | openssl x509 -fingerprint -noout; } | tr "\n" ";" >> salida.txt
sed -i 's/SHA1 Fingerprint=//g' "salida.txt"
sed -i 's/;//g' "salida.txt"
sed -i 's/:/ /g' "salida.txt"
echo "****************DIFERENCIAS******************"
diff certificadosJEP.txt salida.txt
