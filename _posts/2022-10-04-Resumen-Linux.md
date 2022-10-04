---
layout: post
title:  "Resumen Linux"
date:   2022-10-04
last_modified_at: 2022-10-04
---


$ Se necesitan 2 particiones como minimo, una para Linux y sus app y otra para la memoria swap.
$ Linux solo tiene un directorio raiz (root), y todo lo que se monta, cualquier particion, son ficheros.
$ Directorios principales:
    -En /bin y /usr/bin estan los ejecutables y comandos mas comunes.
    -En /sbin y /usr/sbin estan los comandos ejecutables para secuencias de arranque y responder ante fallos del sistema.
    -En /proc estan los procesos que se estan ejecutando en el sistema. Es un sistema de archivos virtual creado por el kernel en memoria.
    -En /usr estan las aplicaciones.
    -En /opt se pueden instalar app igual que en /usr.
    -En /lib y /usr/lib estan las librerias.
    -En /dev estan los posibles dispositivos hardware (sdaX, cdrom, etc).
      /dev/stderr - 2 --> Salida estandar de los errores (pantalla).
      /dev/stdout - 1 --> Salida estandar (pantalla).
      /dev/stdin - 0 --> Entrada estandar(teclado).
      /dev/null --> Salida nula (vacio).
    -En /lost+found se guardan los errores de arranque.
    -En /etc estan los archivos de configuracion y en la carpeta default las configuraciones por defecto.
    -En /var contiene elementos variables.
    -En /home es el directorio de trabajo de cada usuario.
    -En /media y /mnt estan los dispositivos multimedia que se conecten al equipo.
    -En /root es la carpeta del superusuario.
$ Linux es case sensitive (distingue entre minusculas y mayusculas).
$ Lenguaje de programación interactivo (shell script).
$ Linux es multiusuario y multitarea.

$ Archivos importantes del sistema a tener en cuenta:
    -COLUMNAS:
    -/etc/passwd
      -(1)Nombre de usuario:
      -(2)Contraseña:
      -(3)id:
      -(4)gid:
      -(5)Descripcion:
      -(6)Directorio home por defecto:
      -(7)Interprete de comando:

    -/etc/group
      -(1)Nombre de grupo:
      -(2)Contraseña:
      -(3)gid:
      -(4)Usuarios que pertenecen a ese grupo:

    -/etc/shadow
      -(1)Nombre de usuario:
      -(2)Contraseña:
        -! contraseña caducada o inactiva.
        -* demonio.
        -lk significa que la contraseña estaria bloqueada.
      -(3)nº de dias desde el 1/1/1970:
      -(4)Dias hasta que la contraseña pueda ser cambiada:
        -*0 se puede cambiar cuando se quiera.
      -(5)Dias que deben pasar hasta que la contraseña caduque:
        -99999 significa que no caduca
      -(6)Dias hasta que el sistema preavisa que la contraseña caduca:
      -(7)Dias desde que caduca la contraseña hasta que la cuenta pase a estar inactiva:
      -(8)Dias hasta que el login expira:
      -(9)Reservado para informacion del futuro:

$ Todo lo que esté en /etc/skel/ aparecerá en el home de cualqueir usuario creado por defecto
$ Se requiere reiniciar para que surjan efectos cuando se mete un usuario en un grupo nuevo
$ Un software privativo solo defiende los intereses de la empresa que lo comercializa y éste no puede ser modificado. En cambio, un software libre o abierto es accesible a todo el mundo y puede ser modificado. Un programa puede ser considerado software libre cuando respeta las cuatro libertades esenciales:
    -Libertad 0: te permite ejecutar el programa como quieras.
    -Libertad 1: puedes estudiar el código fuente del programa y tienes libertad para cambiarlo, con la idea de que pueda hacer alguna acción que haga falta.
    -Libertad 2: te permite hacer y distribuir copias exactas del programa cuando quieras y así ayudar a otros.
    -Libertad 3: puedes contribuir a la comunidad, con la facilidad de hacer o distribuir copias con tus versiones modificadas del programa.
$ Todo software libre es de código abierto, pero no todo programa de código abierto es un software libre. La diferencia está en las licencias que pueden usarse para el programa: algunas son menos permisivas que otras y poco respetan las libertades antes mencionadas.

$ En /etc/fstab se encuentra la información sobre las particiones:
    -El primer campo muestra el nombre de la particion.
    -El segundo campo muestra el punto de montaje de dicha particion.
    -El tercer campo muestra el sistema de ficheros usado por la partición.
    -El cuarto campo muestra las opciones de montaje usadas por mount cuando trata de montar la partición.
    -El quinto campo es usado por dump para determinar si la partición necesita ser volcada o no.
    -El sexto campo es usado por fsck para determinar el orden en que los sistemas de ficheros deben ser comprobados si el sistema no se apagó correctamente.



.:.:.:.:COMANDOS DE LINUX:.:.:.:.
*Comandos probados en Debian 8 (pueden variar en distintas distribuciones).

~]$ Comandos generales/básicos:

$ sudo "comando" --> Realizar un comando con permisos de root.
$ su --> Se convierte en "root" el usuario actual (menos potente que el comando siguiente).
$ su - --> Se convierte en el "root" verdadero.
$ logout --> Se desloguea de la cuenta actual.
$ passwd "usuario" --> Cambia la contraseña del usuario.
$ nano /etc/hostname --> cambiar nombre del equipo. (nano es un editor de texto desde la terminal).
$ cd --> Nos situa en el directorio "home" del usuario actual.
$ cd .. --> Nos sube al directorio padre.
$ pwd --> Nos dice la ruta en la que nos encontramos.
$ !! --> ejecuta el ultimo comando usado.
$ echo "texto" --> Muestra el texto por pantalla.
$ bit setuid --> Es el bit que permite a un usuario ejecutar archivos que no son suyos. 
$ clear --> Limpia la pantalla.
$ time comando --> Muestra el tiempo de ejecucion del comando.
$ ifconfig --> Muestra todo lo relacionado con la direccion IP.
$ alias --> Nos muestra todos los alias de la terminal.
    -alias nuevo_alias='comando' --> Crea un alias (hay que colocarlo en /etc/bash.bashrc) y hacer "source .bashrc".
$ echo $? --> Muestra el valor de restitucion del ultimo comando ejecutado.


~]$ Parecidos y diferencias entre enlaces duros y simbolicos y como crearlos:
 
    -Los enlaces duros tienen el mismo inodo que y los simbolicos no.
    -En el enlace duro se copian los permisos del original, en el enlace simbólico no se copian los permisos del original, este tendrá activos todos los permisos
    -Cuando hacemos un enlace simbólico a una carpeta nos guardara todos los cambios que se hagan dentro de la carpeta.
    -En ambos enlaces nos permite crear enlaces de otros archivos que son también enlaces.
    -En un enlace duro no puede crear un enlace de un fichero que no existe, en cambio en el enlace simbólico si nos lo permite.
    -El enlace duro apuntan a posiciones físicas iguales, en cambio, en el enlace simbolico apunta a diferentes posiciones de memoria física.
    -En ambos aunque se modifique un fichero, se adaptaran los cambios en ellos.
    -En el enlace duro tienen el mismo Id de inodo, en el enlace blando no tienen el mismo, pues no señalan a la misma posición física. En el caso del enlace blando, almacena una dirección donde se encuentra el fichero original.
    -Los enlaces simbolicos se pueden crear a un directorio y también a un archivo/directorio de otro sistema de archivos.
    -Los enlaces simbólicos son procesados por el núcleo del sistema de manera diferente a los duros.
    -Si borramos el original del enlace simbólico ya no podemos hacer nada, sin embargo si borramos el original de un enlace duro, podremos seguir trabajando en el enlace duro creado.

$ Crear enlaces duros y simbolicos:
    -Enlace duro: ln fichero ficheroduro
    -Enlace simbolico: ln -s fichero ficherosimbolico



~]$ Conexiones remotas:
*Puede venir instalado de base.

$ apt-get install ssh --> instalar servicio ssh
$ apt-get install openssh-server --> instala servidor ssh

$ ssh usuario@ip --> Nos conectamos con el "usuario" al servidor "ip".

$ Comandos dentro del servicio ssh:
    -$ echo "texto" | wall --> Envia en "Broadcast" el "texto".
    -$ mail --> Nos muestra la bandeja de entrada de los mails.
      -*Con la "q" guardamos los mensajes en el /home/mbox.
      -*Con "exit" salimos sin guardar los mensajes.
    -$ mail "usuario" --> Enviamos un email al usuario elegido.
    -$ write "usuario" --> Habla con otro usuario.
      -*A veces esta opcion puede venir desactivada.


~]$ Comando "ls":

$ ls (ruta) --> Muestra el contenido de dicha ruta.
$ ls -l --> Muestra el contenido detalladamente.
$ ls -a --> Muestra el contenido incluyendo los ocultos.
$ ls -R --> Muestra el contenido recursivamente.
$ ls -C --> Muestra el contenido en columnas.
$ ls -lt --> Muestra el contenido ordenador por fecha de creacion mas reciente.
$ ls -S --> Muestra el contenido ordenado por el de mayor tamaño.
$ ls -lh --> Muestra el contenido en formato humano (Kilobytes).
$ ls -s --> Muestra el contenido en orden alfabetico.
$ ls -n --> Muestra el "uid" y el "gid" en lugar de los nombres de usuario y grupo, respectivamente.
$ ls -r --> Muestra el resultado inversamente, es decir, ls -ltr mostraria los mas antiguos primero.
$ ls -i --> Muestra el numero de inodo.
$ ls -1 --> Muestra el contenido solo en una columna.
$ ls -d "directorio" --> Muestra solo el directorio, no su contenido.


~]$ Manejo de archivos:

$ mkdir "nombre" --> crea un directorio.
$ touch "nombre" --> crea un archivo.
$ gedit/nano/vi nombrearchivo --> Editores de texto para modificar el archivo "nombrearchivo", (gedit es de entorno grafico).
    -No utilizar "vi", recomendado usar "nano".
$ rmdir "directorio" --> Borra el directorio siempre y cuando este vacio.
$ rm "fichero" --> Borra el fichero, (se pueden borrar tantos ficheros como se quieran, solo hay que ponerlos uno detras de otro con un espacio).
    -$ rm -f "fichero" --> Borra el fichero sin pedir confirmacion.
    -$ rm -rf --> Borra todo recursivamente **Usar con mucho cuidado**.
$ cp "archivo" "archivocopia" --> Copia el "archivo" con el nombre "archivocopia".
    -$ cp -r "directorio" "directoriocopia" --> Copia el directorio entero, sin el -r no copiaria recursivamente lo que hubiera dentro.
    -$ cp -t "directorio" "directoriocopia" --> Copia los archivos que haya dentro del directorio, sin el directorio.
$ mv "archivo" "/home/asir1" --> Mueve un archivo al destino /home/asir1.
    -*Si "mv" se realiza en el mismo directorio cambia el nombre al archivo, es decir: mv archivo archivito (archivo pasara a llamarse archivito y no se movera a ningun lado).
$ cmp/diff archivo1 archivo2 --> Compara el contenido de dos archivos escritos (diff muestra mas informacion que cmp).
$ file "rutadelarchivo" --> Nos muestra el tipo de archivo que es, y si es un fichero su codificacion (text ASCII).
$ nl "archivo" --> Numera las lineas de un archivo.
$ stat fichero --> Muestra mucha informacion de un fichero.


~]$ Informacion sobre comandos:

$ type "comando" --> Informacion sobre el comando.
$ whereis "comando" --> Nos muestra la ruta del ejecutable y la direccion del man de ese comando.
$ which "comando" --> Muestra la ruta del ejecutable.
$ whatis "comando" --> Nos dice que hace el comando y la pagina del man en la que e encuentra.
$ locate "comando/archivos" --> Busca cualquier cosa.
	-* $ updatedb --> Actualiza la base de datos, necesario para usar locate.
    -cb "comando" --> Muestra el numero de referencias a ese comando. 


~]$ Uso del "man", "info" y "help":

$ man comando --> Saca toda la informacion de un comando. 
	-$ "espacio" salta tantas lineas como pantalla y "enter" pasa linea a linea.
	-$ "G" para ir al final y "g" para ir al principio.
	-$ "/cadena" para buscar (n para siguiente y b para el anterior).
	-$ "h" para ayuda.
	-$ El man esta distribuido en 9 secciones.
	-$ "q" para dejar el manual.
	-$ En "man man" aparecen la lista de secciones del man.
	-$ "a comando" --> Muestra todos los manuales del man de ese comando.
	-$ "5 comando" --> Muestra la pagina del man de ese comando.
	-$ "-f comando" --> Muestra qué te enseña a hacer cada seccion del manual de ese comando.
  -$ "-k palabra" --> Muestra todo lo relacionado con esa palabra en todo el man.
$ apropos "palabra" --> Lo mismo que el de arriba.
$ info "comando" --> Tiene una estructura organizativa diferente al man.
	-$ "h" para ver la ayuda sobre navegacion en el info y "x" para salir de esta.
	-$ "s" para buscar algo.
	-$ Hay un menu donde posicionandose encima se puede ir presionamdo enter.
	-$ "l" para volver al menu.
$ "comando --help" --> Parecido a la seccion de sinopsis del man.
$ "cd /usr/share/doc/" --> Ayuda avanzada.


~]$ Comando "date":

$ date --> Muestra fecha, hora y zona horaria.
	-$ "date +%d" --> Saca el dia del mes.
	-$ "date +%D" --> Saca la fecha.
	-$ "date +%Y" --> Saca el año.
	-$ "date +%S" --> Saca los segundos.
$ cal --> Muestra el calendario.


~]$ Calculadora:

$ bc --> Nos sale el prompt para meter operaciones.
$ echo "calculo" | bc --> Hace un calculo sin entrar en la calculadora.


~]$ Apagar el sistema:

$ shutdown --> Apaga el equipo.
    -$ -h now --> Apaga el equipo en ese momento.
    -$ -t X --> Apaga el equipo despues de X minutos.
    -$ -c --> Cancela el apagado del equipo.
    -$ -h X "adios" --> Apaga el equipo mostrando "adios" pasado X minutos.


~]$ Historial:

$ history --> Muestra el historial de comandos usados.
    -$ history X --> Muestra los ultimos X comandos usados.


~]$ Variables:

$ var=Hola (funciona con "" y '') --> Se crea una variable local y con "echo $var" se la muestra.
$ echo $HISTHIZE --> Muestra el tamaño del historial.
$ echo $PATH --> Muestra la ruta donde estan los ejecutables.
$ export var --> Exporta una variable.
$ env | grep var --> Busca la variable especificada si es de entorno.
$ var=$var' 'caracola --> Adiciona caracola a la variable definida antes.
$ var=$var" caracola" --> Lo mismo que el anterior comando.
$ PATH=/home/alumno:$PATH --> Mete el directorio donde esta alojado un script hecho por el usuario en la variable path para poder ejecutalo desde donde se quiera.
$ unset var --> Borra una variable.
$ PS1,PS2,PS3 --> Variables que alojan el nombre de prompt.
$ PS1="Hola \u@\h:\w" --> Modifica el prompt "Hola usuario@equipo:".
$ cd /home/alumno --> gedit .bashrc --> Añadir al final PS1="Loquesea \u@\h:\w" --> modifica el prompt del usuario permanentemente.
$ nano /etc/bash.bashrc --> Añadir al final PS1="Guido@\u\h:\w" --> Modifica el prompt del root permanentemente.


~]$ Comando de la Terminal:

$ whoami --> Dice quien soy.
$ who --> Muestra quien esta logueado (usuario, terminal y hora de logueo).
$ w --> Informacion detallada de que esta haciendo en ese momento el que esta logueado
$ "tee /dev/pts/0 | tee" --> Escribir en un terminal y que aparezca en el otro.
$ tty --> Muestra cual es la entrada terminal actual.
$ last --> Muestra los ultimos usuarios que se han logueado (o cualtas veces te has logueado).
    -$ -b --> Muestra incluso desde que ip se han conectado.
    -$ -a --> Lo mismo que el last pero cambia las columnas de sitio.
$ lastlog --> Muestra los accesos de los usuarios.
$ lastb --> Muestra los intentos fallidos de login.


~]$ Informacion del sistema:

$ uname --> Muestra cual es el SO.
    -$ -r --> Muestra la version de kernel.
    -$ -a --> Muestra toda la informacion.


~]$ Comandos "more" y "less":

$ Ambos comandos sirven para paginar ficheros.
    -$ cat "fichero" | more --> Pagina el "fichero".



~]$ Filtros para modificar la salida de un fichero:

$ head "archivo" --> Muestra las 10 primeras lineas de un fichero.
    -$ head -5 fichero --> Muestra las 5 primeras lineas de un fichero.
    -$ head -n +5 archivo --> Muestra las 5 primeras lineas de un fichero.
    -$ head -n -5 archivo --> Muestra todo el documento menos las 5 ultimas lineas.
$ tail "archivo" --> Muestra las 10 ultimas lineas de un fichero.
    -$ tail -n -5 archivo --> Muestra las 5 ultimas lineas de un fichero.
    -$ tail -n +5 archivo --> Muestra a partir de la 5º linea.
    -$ tail -f archivo --> Muestra las ultimas lineas de un archivo actualizando si esto sucede.
    -$ tail /etc/passwd > ~/mipassword --> Muestra las ultimas 10 lineas del fichero passwd.
$ cat "archivo" --> Muestra el contenido de un archivo.
    -$ "texto" > Archivo --> Crea en un archivo con el texto anterior.
$ sort "archivo" --> Muestra el fichero ordenado por el primer caracter de cada fila.
    -$ sort -t: -k3 -n archivo --> muestra ordenado ascendente por uid numerico  .
    -$ sort -t: -k3 archivo --> muestra ordenado ascendente por uid en ASCII.
    -$ sort -t: -k3 -n -r archivo --> muestra ordenado descendente por uid numerico.
    -$ sort -t: -k3 -k2 -n archivo --> muestra ordenado dos campos (segundo criterio).
    -$ sort -t: -k3 -n archivo | head -n 1 archivo --> muestra el primero ordenado por uid.
    -$ sort -t: -k7 -nr coches | head -n1 --> saca el coche mas caro.
$ cut "fichero" --> Corta secciones de cada linea del fichero.
    -$ cut -d: -f1,5 /etc/passwd/ > datos --> crea un fichero donde aparezcan dos campos.
    -$ cut -d: -f1,2,3,6 /etc/passwd/ > datos1 --> cut -d: -f3-5 /etc/passwd/ > datos2 --> join -t: -j1 1 -j2 3 datos1 datos2 > union --> une campos de dos ficheros y uniendo el campo en comun (tiene que ser el mismo).
    -$ cut -d: -f1,3,5 --output "," /etc/passwd | grep 1[0-9][0-9][0-9] | cut -d"," -f1,3 --> lo mismo de arriba pero mas eficaz.
    -$ cut -d: -f1,2,5,7 coches | grep -w "diesel" --> saca los coches diesel, mostrando nombre, marca y precio.
$ grep -i "^f" coches | sort -t: -k2 --> saca el coche que empiece por f.
$ getent passwd | sort -t: -k3 -n | grep -A30 "1000" | cut -d: -f1,5 | tr -s ":" "," --> saca el nombre y apellido del usuario del sistema que tiene un uid por encima de 1000.
$ echo -n "pepito" | tr -dc [aeiou] | wc -c --> cuenta el nº de vocales que hay en la palabra.

~]$ Filtro TR:

    -$ tr a-z A-Z --> cambia las letras de la a-z a mayuscula.
    -$ tr -s " " --> elimina los espacios en blanco repetidos.
    -$ tr echo hola | tr -d "o" --> elimina la o de la palabra o texto deseado.
    -$ tr hola | tr -c "hol" "A" --> modifica todo lo que NO SEA hol por una A.
    -$ tr hola | tr -c "hol" "pal" --> igual pero solo coge la ultima letra de la palabra.
    -$ tr hola | tr -t "la" "pa" --> cambia la por pa.
    -$ tr si el segundo termino fuera de mayor longitud solo cambiaria la cantidad de 	caracteres del primer termino.
    -$ tr si el segundo termino fuera de menos longitus cambiaria solo esa longitud de 	caracteres del primer termino.

~]$ Redireccionamiento:

    -$ ls /fake 2> errores --> guarda en el fichero los errores al ejecutar el comando.
    -$ fake algo >> info --> muestra el error de fake y mete en el fichero el resultado del comando.
    -$ fake algo 2>> errores --> adiciona al fichero los errores al ejecutar el comando.
    -$ fake algo >> info 2>> errores --> adiciona a cada fichero la salida correspondiente.
    -$ /fake &> todo --> guarda en el fichero todo.

~]$ Grep:

    -$ grep 'palabra o letra' fichero --> busca algo en un fichero.
    -$ grep --color 'a..' ejemplo --> muestra en color la palabra donde aparezcan lo especificado.
    -$ grep '[ab][a-d]' ejemplo --> muestra palabra que empiecen por el primer rango, si no el segundo.
    -$ grep '[d-a]' ejemplo --> no es valido.
    -$ grep --color '[abc]d' ejemplo --> colorea una letra del primer parametro posible y el segundo.
    -$ grep --color '[^abc]d' ejemplo --> colorea el caracter que no sea el especificado y la d.
    -$ grep --color 'd' ejemplo --> colorea los caracteres especificados.
    -$ grep --color 'd*' ejemplo --> colorea los caracteres iguales al especificado del documento.
    -$ grep 'c$' ejemplo --> busca el final de una linea.
    -$ grep '^x' ejemplo --> busca linea que empiece por la letra especificada.
    -$ grep --color 'cd*' ejemplo --> busca linea que contenga al menos una c y 0 o muchas d junto a c.
    -$ grep 'cd\*' ejemplo --> busca linea donde aparezca cd*^(la barra interpreta literalmente).

~]$ Egrep = Grep -E:

    -$ grep -E 'colou?r' fichero --> busca si tiene o no el caracter a la izquierda de la ?.
    -$ grep -E 'colo.r' fichero --> busca cualquier letra lugar de ese punto.
    -$ grep -E 'd+' fichero --> busca todas las d del fichero.
    -$ grep -E 'color|colour' fichero --> busca dos parametros.
    -$ grep -i 's.*m.*b' /usr/share/dict/words --> busca una s que siga a un caracter y lo que siga, una m, un caracter y lo que siga y una b en ese directorio.
    -$ grep -n 'ocurrencia' fichero --> dice el numero de linea donde esta la ocurrencia buscada.
    -$ grep -w 'agua' fichero --> busca literalmente lo especificado.
    -$ grep -v 'hola' fichero --> busca todo menos la ocurrencia.
    -$ grep -c 'sam' fichero --> cuenta en cuantas lineas esta la ocurrencia.
    -$ grep -l 'hola' fichero fichero2 fichero2 --> muestra en que ficheros esta lo que se busca.
    -$ grep -L 'hola' fichero fichero2 fichero2 --> lo contrario al anterior.
    -$ grep -e 'co' -e 'ou' color --> anida ocurrencias.
    -$ grep -q 'root' fichero --> busca algo en silencio (sirve mas para scripts).
    -$ grep -A2 "adios" fichero --> muestra aparte de la coincidencia, las dos lineas siguientes.
    -$ grep -a2 "adios" fichero --> muestra aparte de la coincidencia, las dos lineas siguientes y anteriores.
    -$ grep -B2 "adios" fichero --> muestra aparte de la coincidencia, las dos lineas anteriores.
    -$ grep -b2 "adios" fichero --> muestra aparte de la coincidencia, las dos lineas siguientes y anteriores, y el numero de caracteres contando el salto de linea desde el inicio.
    -$ grep -C2 "adios" fichero --> igual que el -a2.
    -$ grep -v -e "a" -e "b" -e "c" --> lo mismo que -v pero anidando ocurrencias.
    -$ grep -o "hola" fichero --> muestra solo la ocurrencia de la linea.
    -$ grep "es.*linea" fichero --> muestra las lineas entre el es y linea de todo el documento.
    -$ grep -o "es.*linea" --> muestra las lineas literales entre es y linea de cada linea.
    -$ grep -b "linea" --> muestra el nº de caracteres hasta la linea de la ocurrencia.
    -$ grep -ob "linea" --> muestra el nº de caracteres hasta la ocurrencia.
    -$ grep "hola --intro-- adios" fichero --> busca en un fichero dos o mas coincidencias (igual que egrep, grep -E, grep -F).
    -$ grep -E "\<a" fichero --> busca las palabras que empiecen por una letra especificada.
    -$ grep -E "a\>" fichero --> busca las palabras que acaben por una letra especificada.
    -$ grep -E --color '[0-9]' /etc/passwd --> busca los usuarios que tengan numeros.
    -$ grep -E --color '[0-9]{3}' /etc/passwd --> busca los usuarios que tengan 3 numeros.

~]$ Filtro WC:

    -$ wc -l archivo --> cuenta el número de lineas del archivo .
    -$ wc -c archivo --> cuenta el número de bytes.
    -$ wc -m archivo --> cuenta el número de caracteres incluido el salto de linea.
    -$ wc -w archivo --> cuenta el número de palabras.
    -$ wc -L archivo --> cuenta el número de caracteres de la línea más larga (funciona mejor con la salida de otro comando).
    -$ echo "hola caracola" | wc -L --> saca el numero exacto de caracteres entre las comillas.

~]$ Comando FIND **Importante**:

    -$ find . -name nombre --> busca en el directorio actual por nombre.
    -$ find ruta -name nombre --> busca en ese fichero por nombrearchivo.
    -$ find /etc -name nombre -ls --> busca en ese directorio por nombre de forma detallada.
    -$ find . -size 10c -ls --> busca archivos de 10 byte.
    -$ find . -size +100M -ls --> busca archivos que tengas mas de 100 megas.
    -$ find . -size 10c -type f -ls --> busca archivos que tengan 10 bytes Y el tipo que empiece por f.
    -$ find . -size +5M -a -size -10M --> busca los archivos que tengan entre 5mb y 10 mb.
    -$ find . -name "*bash*" --> busca por nombre los que contengan en alguna parte no especificado.
    -$ find . -type d -name "d*" --> busca directorios que empiecen por letra o palabra especificada.
    -$ find . -name "*.tmp" -delete --> busca por nombre .tmp y lo borra.
    -$ find . -name "*.tmp" -exec rm {} \; --> lo mismo de arriba.
    -$ find . -name "pep*" -type f -exec ls -l {} \; -exec cat {} \; --> busca el archivo y muestra el contenido.
        *Con -exec ejecutas otros comandos.
        *Con \; para separar comandos.
    -$ find . -perm 644 --> muestra los archivos que tengan esa mascara.
        *Si se hace con letras (-u+rw-g+x-o+rwx) lo hace recursivamente.
    -$ find . -perm -644 --> muestra los archivos que tengan esa mascara como minimo en adelante.
    -$ find . -perm /644 --> muestra cualquier cosa que tenga una coincidencia.
    -$ find . -perm -444 -perm /222 ! -perm /111 --> muestra solo los que no tengan perm de ejecucion.
    -$ find . -newer fichero --> busca los ficheros mas nuevos que el indicado.
    -$ find . -anewer fichero --> busca los ficheros que han sido accedido mas recientemente.
    -$ find . -atime -7 -exec rm {} \; --> borra la ultima semana.
    -$ find . -atime +7 -exec rm {} \; --> borra los que no se ha tenido acceso esta semana.
    -$ find . -amin -3 -a -amin +1 --> muestra los que han sido accedido hace 3 minutos pero no en el ultimo minuto.
    -$ find . -cmin(time) +15 --> busca los que NO han cambiado sus permisos en los ultimos 15 min.
    -$ find . -mmin 1 --> busca los que han sido modificados hace 1 minuto exacto.
    -$ find . -mmin -1 --> busca los que han sido modificados.
    -$ find . -maxdepth 1 -type f -iname "a*" --> busca los ficheros que empiecen por a o A.
    -$ find / -nogroup --> busca archivos huerfanos (sin grupos).
    -$ find . -perm -g=r -type f -ls --> muestra todos los ficheros que tengan permisos de lectura en el terceto de grupo.
    -$ ls -l | grep "^-" | grep "[r-][w-][x-]r--[r-][w-][x-]" --> igual a lo de arriba.
    -$ find . -type d -empty -exec rmdir {} \; --> borra todos los directorios vacios.


~]$ CHMOD:

    MASCARA "rwx" (r=read, w=write, x=execute):
      000 ->0
      001 ->1
      010 ->2
      011 ->3   
      100 ->4 
      101 ->5
      110 ->6
      111 ->7
    **Si los permisos son sobre ficheros:
      -$ r permite ver el archivo.
      -$ w permite cambiar nombre y editar.
      -$ x permite si es un ejecutable, ser ejecutado.
    **Si los permisos son sobre directorios:
      -$ r permite ver el directorio.
      -$ w permite ver o cambiar nombre.
      -$ x permite acceder y hacer todo lo demas.


    -$ chmod u(g,o)+(-)x(r,w) fichero --> da (o quita) permidos en el terceto especificado.
    -$ chmod ugo+(-)x(r,w) fichero --> da (o quita) permidos en todos los tercetos.
    -$ chmod a=rwx fichero --> igual al de arriba.
    -$ chmod =x fichero --> le esta dando SOLO la x a toda la mascara.
    -$ chmod = fichero --> le quita todos los permisos al fichero.
    -$ chmod 644 fichero --> da permisos a todos los tercetos.
    -$ chmod 112 fichero --> modifica los permisos borrando los anteriores.
    -$ chmod +644 fichero --> añade los permisos adicionandolos con los anteriores.
    -$ chmod -112 fichero --> borra los permisos especificados dejando los no especificados.
    -$ chmod 4750 fichero --> El numero "4" esta relacionado con sticky bit, el 1 con el setuid y el 2 con el guid.


~]$ Comando "umask":

$ umask --> Muestra la mascara por defecto.
    -$ umask nº --> Cambia la mascara por defecto en la sesion actual.
$ nano /etc/bash.bashrc --> Cambia la mascara por defecto en todas las sesiones.


~]$ Comandos "chown" y "chgrp":

$ chown usuario fichero/carpeta --> cambia el propietario (no es recursivo para directorios).
    -$ chown -R usuario directorio --> cambia el propietario de forma recursiva.
    
$ chgrp grupo fichero --> cambia el grupo propietario de un fichero.


~]$ Administracion de usuarios y grupos:


$ newgrp "nombre" --> Cambia de grupo al usuario actual temporalmente.
$ su "user" --> Cambia de usuario.
$ groupadd grupo --> Crea un nuevo grupo.
    -$ groupadd -r grupo --> Crea un nuevo grupo del sistema.
    -$ groupadd -g "gid" grupo --> Crea un grupo con un gid determinado.
$ groupdel grupo --> Elimina.
$ groups --> Muestra a que grupos pertenece el usuario logueado.
$ groups usuario --> Muestra a que grupos pertenece el usuario.

$ useradd -r usuario --> Crea una cuenta del sistema.
$ useradd usuario --> Crea un usuario con los parametros por defecto.
    -$ useradd -c "Comentario" --> Añade un comentario del usuario, quinto campo del passwd.
    -$ useradd -dm ruta --> especifica el directorio de trabajo.
    -$ useradd -u uid por encima de 1000 --> especifica el uid del usuario.
    -$ useradd -g gid --> especifica el grupo principal del usuario.
    -$ useradd -G gid (separado con espacios entre c/u) --> especifica lista de grupos secundarios del usuario.
    -$ useradd -o uid duplicado --> permite crear usuarios con UID duplicados .
    -$ useradd -e YYYY-MM-DD --> especifica cuando el usuario no tendra acceso a la cuenta (modifica el campo 8 del shadow).
    -$ useradd f [días] --> periodo de inactividad de la contraseña de la nueva cuenta (modifica campo 7 del shadow).
    -$ useradd -k directorio --> utiliza este directorio «skeleton» alternativo.
    -$ useradd -D --> muestra la informacion por defecto que le daría al nuevo usuario.
    -$ useradd -D -f nº --> cambia la informacion que cambia por defecto el campo 7 del shadow al crear un usuario nuevo.
$ nano /etc/login.defs --> escribir CREATE_HOME yes --> Cuando se crea un usuario le crea un home por defecto.
$ finger --> Muestra mas informacion detallada del usuario logueado.
$ userdel -r usuario --> Borra un usuario incluido su home.


~]$ Comando "gpasswd":

$ gpasswd grupo --> Da contrseña a un grupo.
    -$ gpasswd -d usuario grupo --> Borra un usuario del grupo.
    -$ gpasswd -r grupo --> Quita la contraseña de un grupo.


~]$ Comando "groupmod":

$ groupmod -n "nuevonombre" grupo --> Cambia el nombre del grupo.
    -$ groupmod -g "nuevogid" grupo --> Cambia el gid del grupo (los archivos creados por el propietario de ese grupo hará que sean huefanos).
    -$ groupmod -p "nuevacontraseña" grupo --> Cambia la contraseña del grupo.


~]$ Comando "passwd":

$ passwd usuario --> Introducir contraseña --> Le otorga una contraseña a un usuario.
    -$ passwd -d usuario --> Borra la contraseña de un usuario. Modifica el 2º campo del shadow.
    -$ passwd -l usuario --> Bloquea la contraseña de un usuario. Modifica el 2º campo del shadow.
    -$ passwd -u usuario --> Desbloquea la contraseña de un usuario. Modifica el 2º campo del shadow.
    -$ passwd -e usuario --> Hace que expire la contraseña y que el usuario introduzca una nueva al loguearse.
    -$ passwd -n nºdias usuario --> Nº dias que deben pasar para poder cambiar la contraseña. Modifica el 4º campo del shadow.
    -$ passwd -x nºdias usuario --> Nº dias para que la contraseña caduque (99999 no caduca). Modifica el 5º campo del shadow.
    -$ passwd -w nºdias usuario --> Nº de dias con los que te avisa antes de caducar. Modifica el 6º campo del shadow.
    -$ passwd -i nºdias usuario --> Nº de dias de inactividad antes de estar caducada. Modifica el 7º campo del shadow.
    -$ passwd -S usuario --> Muestra un informe sobre la contraseña del usuario (P tiene contraseña, NP no tiene contraseña, L esta bloqueada o es cuenta del sistema).
    -$ passwd -aS --> Muestra informacion detallada de las contraseñas de TODOS los usuarios.


~]$ Comando "usermod":

$ usermod "usuario":
    -$ usermod -s consola (/bin/sh por ejemplo) usuario --> Cambia la consola del usuario.
    -$ usermod -m -d "ruta" --> Mueve los datos del directorio home al nuevo "ruta".
    -$ usermod -e YYYY-MM-DD usuario --> cambia la fecha en la que expira la cuenta.
    -$ usermod -p contraseña usuario --> Modifica la contraseña pero no la encripta.
    -$ usermod -p "" usuario --> Quita la contraseña de un usuario.
    -$ usermod -L usuario --> Bloquea la contraseña de un usuario.
    -$ usermod -l "nuevonombre" usuario --> Cambia el nombre de un usuario.
    -$ usermod -u nuevo_uid usuario --> Cambia el uid del usuario.
    -$ usermod -U usuario --> Desbloquea la cuenta de un usuario.
    -$ usermod -g "grupo" usuario --> Mete al usuario al grupo principal especificado.
    -$ usermod -G "grupo" usuario --> Mete al usuario al grupo especificado pero borra los anteriores.
    -$ usermod -aG "grupo" usuario --> Mete al usuario al grupo especificado pero SIN borrar los anteriores.


~]$ Comando "chage":

$ chage "usuario": 
    -$ chage -m dias usuario --> Cambia el nº de dias hasta el cambio de contraseña (si es 0 la deja cambiar cuando se quiera).
    -$ chage -M nº dias usuario --> Cambia el nº de dias maximo durante la contraseña sea valida.
    -$ chage -I nºdias usuario --> Especifica el nº de dias que la cuenta estara inactiva.
    -$ chage -W nºdias usuario --> Preaviso hasta que la contraseña deba ser cambiada.


~]$ Comando "id":

$ id usuario --> Muestra todos los datos del usuario.
    -$ id -u usuario --> Muestra id de usuario.
    -$ id -g usuario --> Muestra id del grupo de ese usuario.
    -$ id -G usuario --> Muestra id de todos los grupos.
    -$ id -Gn usuario --> Muestra los nombres de los grupos a los que pertenece el usuario. 
    -$ id -gn --> Muestra el grupo actual.
    -$ id -Gn --> Muestra TODOS los grupos del usuario actual.


~]$ Comando "getent":

$ getent "passwd/shadow/group" --> Muestra la base_datos especificada.


~]$ Fichero "login.defs":

    -$ PASS_MAX_DAYS nº --> nº max dias que la contraseña puede ser usada.
    -$ PASS_MIN_DAYS --> nº min dias permitido entre cambios de contraseñas .
    -$ PASS_MIN_LEN nº --> nº caracteres que todo usuario debera tener.
    -$ PASS_WARN_AGE nº --> nº dias de aviso antes de que la contraseña expire.
    -$ UID_MIN uid --> uid minimo de cualquier usuario nuevo.
    -$ GID_MIN gid --> gid minimo de cualquier grupo nuevo.


~]$ Comando "visudo":

    -$ apt-get install sudo --> Instala el comando sudo. 
    -$ visudo --> **Debajo de la linea de root** "usuario" ALL=(ALL) ALL


~]$ Comando "dd":

    -$ dd --> Sirve para hacer imagenes.
	-$ dd if=origen |pv| dd of=destino --> Con el pv muestra lo que esta haciendo.
	-$ sudo dd if=/dev/sda |pv | dd of=/dev/sdb.
    -$ dd if=/dev/zero/ |pv| dd of="ruta" --> Borra la ruta especificada.


~]$ Comando "du":

    -$ du "directorio" --> Estima el uso de un directorio de forma recursiva.
   

~]$ Comando "free":
    -$ free --> Muestra la cantidad de memoria libre y en uso en el sistema.


~]$ Comando "chsh":

    -$ chsh "usuario" -s (/bin/bash) --> Establecer bash como consola predeterminada.
    -$ "zsh/bash/sh" --> Activa una consola especifica termporalmente.


~]$ Comando "chfn":

    -$ chfn "usuario" --> Cambia la informacion real del usuario.


~]$ Comandos "pwconv" y "pwunconv":

$ pwunconv --> Oculta el fichero /etc/shadow
$ pwconv --> Desoculta el fichero /etc/shadow


~]$ Crear y eliminar particiones con "fdisk":

$Crear:
    -$ fdisk -l --> muestra la lista de particiones activas.
    -$ fdisk /dev/sdb --> se comienza a dar formato.
	-$ En el menu:
	m --> ayuda.
	n --> añade una nueva particion.
	p --> escoge un particion primaria.
	1(1-4) --> se escoge el numero de particiones primarias.
	Enter sin poner nada --> se salta para escoger por tamaño
	+nºG(K,M) --> se escoge el nº de Gb, Mg o Kb de la particion.
	w --> escribe la tabla en el disco y sale de fdisk.
    -$ partprobe --> indica al kernel que vuelva a leer la tabla de particiones.
    -$ fdisk -l --> se puede apresiar como la particion esta ahora creada en /dev/sdb1(nº).
    -$ mkfs.ext4 /dev/sdb1 --> da formato ext4 a la nueva particion.
    -$ mount /dev/sdb1 /datos --> monta TEMPORALMENTE la nueva particion en /datos para que pueda ser usada.
    -$ nano /etc/fstab --> añadir linea: /dev/sdb1	/datos	ext4 --> igual a lo de arriba pero permanentemente.
    -$ chown usuario -R /datos --> cambia el propietario de la carpeta para que el usuario pueda usar la particion.
$Eliminar:
    -$ nano /etc/fstab --> quitar linea añadida previamente --> elimina el automontaje de la particion.
    -$ umount /dev/sdb1 --> desmonta la particion.
    -$ fdisk /dev/sdb --> se accede al menu de fdisk.
	d --> borra una particion (en caso de tener mas de una, especificar el nº cuando lo pida).
	w --> escribe la tabla en el disco y sale de fdisk.
    -$ partprobe --> indica al kernel que vuelva a leer la tabla de particiones.


~]$ Comando "mkfs":

    -$ mkfs (mke2fs) --> da formato a un dispositivo o particion.
    -$ mke2fs -t ext4(vfat) /dev/sdb --> le da formato ext4 a un dispositivo.
    -$ mkfs.sistema_ficheros(vfat,ext4) -n nombre /dev/sdb --> formatea y da nombre a un dispositivo.
    -$ umount /dev/sdb --> desmonta el dispositivo.


~]$ Comando "fsck":

    -$ fsck --> comprueba y repara  errores del sistema de archivos.
	-c --> comprueba.
	-a --> repara.
	-s --> fuerza la revision.
	-R --> pasa del directorio raiz.


~]$ Comando "df":

    -$ df --> muestra los dispositivos y particiones conectados.
	-k --> muestra la informacion en kb.
	-m --> lo mismo pero en mb.


~]$ Comando "tar":
    *Deja los archivos originales*

    -$ tar [opc] nombre_tar ruta1 ruta2 ruta3 -->
	-cvf miprimertar.tar cpman ficheroman ficherito --> archiva varios archivos.
	-tvf miprimertar.tar --> muestra el contenido del .tar
	-xvf miprimertar.tar --> extrae el contenido del .tar
	-vrf miprimertar.tar listadoman --> anexa un nuevo fichero al .tar
	-cvzf miprimertar.gz cpman ficheroman ficherito --> comprime archivos.
	-cvjf miprimertar.bz2 cpman ficheroman ficherito --> comprime archivos.
	cd ruta_donde_extraer --> tar -xvzf /home/asir104/directorio/comprimido2 --> extrae en la ruta actual el comprimido.


~]$ Comando "gzip":
    *No conserva los archivos originales, NO comprime direcotrios, comprime archivos en varios gz*

    -$ gzip gman --> comprime un fichero.
	-d gman --> descomprime un fichero.
	-9(-9 al -1) gman --> comprime especificando el nivel de compresion.
	-l gman --> muestra informacion del comprimido.
	listadoman gman cpman --> crea varios gz en lugar de un solo gzip.
    -$ gunzip listadoman --> descomprime (igual a gzip -d).
	* --> descomprime todo lo que este en el direcotrio actual.
 

~]$ Comando "zip":
    *Conserva los archivos originales, SI comprime directorios, comprime varios en uno solo*

    -$ zip cpman.zip cpman --> comprime en cpman.zip los ficheros especificados.
	total.zip * -->  comprime en total.zip TODO lo del directorio actual.
	-r total2.zip dirprueba --> comprime recursivamente.
    -$ unzip -l total2.zip --> muestra el contenido del comprimido.


~]$ Comando "bzip2":
    *Se comporta igual que el gzip*

    -$ bzip2 lsman --> comprime.
    -$ bunzip2 lsman.bz2 --> descomprime.


~]$ Comando "cpio":

    -$ ls ruta/directorio | cpio -ov > ruta/copia.cp --> copia todo de la ruta en un fichero.
    -$ cpio -tv < copia.cp --> muestra lo que hay dentro del fichero copia.


~]$ Comando "ps":

    -$ ps --> saca una instantanea de los procesos que estan en ejecucion.
	--forest --> igual pero mostrando la dependencia entre procesos.
	ef --> muestra pid,tty,stat,time y command solo del usuario actual.
	-ef --> muestra uid, pid, ppid, c, stime, tty, time y cmd de todo el sistema.
	-l --> muestra campo F, bandera de señales UID.id del usuario PID. Id del proceso PPID. id del proceso padre, C. linea de comandos PRI. Prioridades, Addr – la dirección de memoria, size – el tamaño, wchan - “estado”.
	-aux --> muetsra user,%cpu,%mem,vsz,rss,tty,start,time,command.
	-o (columna)stat,command --> muestra una o mas columna/s especifica.
	-e --> muestra pid, tty, time, cmd.
	aux | sort -k3 -nr | head -1 | tr -s " " " " | cut -d" " -f1,3 --> muestra el proceso con mayor carga en el sistema.
	-o pid,tty,time,%mem,cmd --sort -r %mem --> ordena por %mem el resultado.
    -$ pstree --> muestra el arbol de procesos.


~]$ Comando "top" y "nice":

    -$ top --> igual al ps aux pero "live" (q para salir).
    -$ nice -10 proceso --> arranca el proceso con 10 de prioridad .
	10 proceso --> arranca el proceso -10 de prioridad.
	-n -5 proceso --> aumenta la prioridad en -5.
	-n 5 proceso --> disminuye la prioridad en 5.
    -$ renice -10 pid --> le da -10 de prioridad a un proceso .
	10 pid --> le da 10 de prioridad a un proceso.
	-n -5 -u usuario --> cambia la prioridad especificada a todos los usuarios especificados.


~]$ Comando "cron":
	*MANJARO: Escribir esto en la terminal: $echo "export EDITOR=nano" >> $HOME/.bashrc && export EDITOR=nano*
	*Y con "crontab -e" ya podemos programar las tareas"*

    -$ /etc/init.d/cron status --> muestra el estatus del demonio cron.
    -$ service cron status --> muestra el estatus del demonio cron.
    -$ ps -ef | grep cron(crond) --> busca en el sistema si existe un demonio/proceso llamado cron o crond.
    -$ /etc/init.d/cron start --> inicia el demonio cron si esta parado.
    -$ service cron start --> inicia el demonio cron si esta parado.
    -$ m h dom mon dow usuario comando --> en el archivo /etc/crontab.
	(0 a 7 siendo 0 y 7 domingo).
	01 * *   * * * --> para ejecutar un comando todos dias, de cada dia de cada mes de cada semana.
	15 20   * * * --> a las 8:15 pm de cada dia, cada mes y cada semana.
	00 5   * * 0 --> a las 5 am cada domingo.
	59 11   * 1-3 1,2,3,4,5 --> a las 11:45 de los meses enero, febrero y marzo de lunes a viernes.
	*/15 10-14   * * * --> CADA 15 minutos de 10 a 2 pm.
	* 12   1-10/2 * 2,8 --> todos los minutos a las 12 cada dos dias de febrero y agosto.
	0 */5   1-10,15,20-23 * 3 --> cada 5 horas de los dias 1 al 10,15,20 al 23 de cada mes y que sea miercoles.
	3/3 2/4   2 2 2 --> cada 3 minutos empezando por el minutos 3, apartir de las 2 cada 4 horas del 2 de febrero y que sea martes.
    -$ crontab -e --> */1 *  * * * echo hola >> /dev/pts/0 --> crea un nuevo crontab cada minuto.
    -$ */15 *  * * * who >> /home/asir104/quien --> cada 15 minutos muestra quien esta logueado.
    -$ crontab -l --> muestra los crontab activos para el usuario actual.
    -$ crontab -r --> borra los crontab activos para ese usuario.
    -$ echo usuario >> /etc/cron.allow --> especifica que usuarios pueden usar crontab.
    -$ echo usuario >> /etc/cron.deny --> especifica que usuarios NO pueden usar crontab.


~]$ Comando "at":

    -$ at HH:MM[:YY opcional] --> ls -l /home/ >> /dev/pts/0 --> programa a cierta hora que se ejecute un comando.
	HH:MM[am(pm)] --> comando --> programa tareas usando am y pm.
	MES/DIA/AÑO --> comando --> programa tareas con formato de fecha completa (se puede separar con . - o todo junto).
	-f script.sh now(tomorrow) +1 minute --> ejecuta el script 1 minuto despues de ahora.
	-d trabajo(jobid) --> borra un trabajo especificado.
	atrm jobid --> lo mismo.
	-l --> muestra la lista de futuros trabajos programados.
	-m HH:MM --> comando --> manda un mail al usuario.
	-v fecha[hora] --> comando --> muestra la fecha del trabajo.


~]$ Comando "nfs":

    -$ apt-get install nfs-common nfs-kernel-server --> instala servicio nfs.
    -$ En el servidor: 
	nano /etc/exports --> ruta_a_compartir ip_objetivo(o red)/mascara[opcion(ro,rw)] --> chmod 747 carpeta_a_compartir --> service nfs-kernel-server restart --> comparte una carpeta a una o varias ip.
	showmount -a --> muestra todos los clientes a los que se les esta compartiendo.
	showmount -d --> muestra todos los directorios que estan siendo compartidos.
	showmount -e --> muestra la lista de exportaciones (/etc/exports).
	exportfs -u --> deja de exportar.
	exportfs -r --> reexporta.
	exportfs -a --> sirve como interruptor, si se esta exportando deja de hacerlo y viceversa.
    -$ En el cliente: .
	mount -t nfs ip_servidor:ruta_carpeta_compartida ruta_montaje --> monta TEMPORALMENTE en un directorio la carpeta compartida por el servidor
	nano /etc/fstab --> añadir linea: ip_servidor:ruta_carpeta_compartida ruta_montaje [permisos(nfs,)] --> mount -a --> monta automaticamente (sin necesidad del comando anterior) al inicio en un directorio la carpeta compartida por el servidor.
	umount ruja_montaje --> desmonta la carpeta compartida.

