---
layout: post
title:  "Configurando Debian 11"
date:   2022-05-27
last_modified_at: 2022-05-30
---

<br>
Como entusiasta del mundo Linux, he sido *distrohopper* mucho tiempo, y puedo asegurar que no hay nada como Debian. Pero para gustos, los culos.<br>
Si a esto le sumamos que me gusta tener un entorno de trabajo funcional y precioso a partes iguales, tras muchas peleas he conseguido mi configuración perfecta.<br>
Voy a dar todos los detalles para llegar al mismo punto, partiendo de una instalación de Debian literalmente **mínima**.
<br><br>*Si no sabes instalar Debian sin entorno gráfico, sal de este blog **[ahora mismo](https://google.es)**.*<br>
<hr><br>
# <center>Contenido</center>
<br>
1. [**Configuración**](#configuración)
2. [**Paquetes**](#paquetes)
3. [**Archivos**](#archivos)
4. [**Combinaciones**](#combinaciones)
5. [**Resultado**](#resultado)

<hr>
## <br><center>Configuración</center><br>
Primero vamos a ponernos como ***root***
```console
sami@debian:~$ su -
Contraseña: ******
root@debian:~#
```
<br>

Ahora, para tener más paquetes a nuestra disposición, vamos a editar el archivo <br>***/etc/apt/sources.list***<br>
Añadimos en cada uno de los repositorios las etiquetas de ***nonfree*** y ***contrib*** y debe quedar tal que así:

```text
deb http://deb.debian.org/debian/ bullseye main contrib non-free
deb-src http://deb.debian.org/debian/ bullseye main contrib non-free

deb http://security.debian.org/debian-security bullseye-security main contrib non-free
deb-src http://security.debian.org/debian-security bullseye-security main contrib non-free

deb http://deb.debian.org/debian/ bullseye-updates main contrib non-free
deb-src http://deb.debian.org/debian/ bullseye-updates main contrib non-free
```
<br>
También voy a modificar el archivo
***/etc/default/grub***
<br>Dentro del archivo modificamos la línea que dice ***GRUB_TIMEOUT=5*** por ***GRUB_TIMEOUT=0***
<br>Con esto, evitamos que aparezca el GRUB al arrancar el sistema.
<br>Una vez guardado el archivo, actualizamos GRUB:
```console
root@debian:~# update-grub
```
<br>

Otra de las cosas que odio es el árbol de carpetas por defecto, como "***Escritorio***", "***Descargas***"...
Por comodidad prefiero modificarlos.<br>
Primero me cargo las carpetas por defecto:<br>
```console
root@debian:~# rm -r /home/sami/*
```
<br>
Y ahora editamos el archivo
<br>***/home/sami/.config/user-dirs.dirs***<br>
Para dejarlo tal que así:
```text
XDG_DESKTOP_DIR="$HOME/desktop"
XDG_DOWNLOAD_DIR="$HOME/downloads"
XDG_TEMPLATES_DIR="$HOME/templates"
XDG_PUBLICSHARE_DIR="$HOME/public"
XDG_DOCUMENTS_DIR="$HOME/documents"
XDG_MUSIC_DIR="$HOME/music"
XDG_PICTURES_DIR="$HOME/images"
XDG_VIDEOS_DIR="$HOME/videos"
```
<br>
*Como sé que sois super listos, no hace falta deciros que pongáis vuestro nombre de usuario en lugar de sami.*
<hr>
## <br><center>Paquetes</center><br>
Vamos a instalar una serie de paquetes a mi gusto.
<br>Sois libres de eliminar o sustituir los paquetes similares, pero tened en cuenta que los archivos de configuración
que usaré en el post son diseñados para estos paquetes especificamente.
```console
root@debian:~# apt update
root@debian:~# apt install gnome sudo firefox-esr kitty zsh compton rofi pulseaudio pavucontrol polybar feh zsh-autosuggestions zsh-syntax-highlighting flameshot ranger thunar git telegram-desktop
```
<br>
### Descripción de Paquetes:<br>
**gnome**: Contiene bastantes paquetes útiles para el sistema y es una forma de tenerlos todos de golpe sin preocuparte mucho.<br>
**sudo**: Debian no trae por defecto el paquete **sudo**, que sirve para ejecutar comandos como root desde los usuarios autorizados.<br>
**firefox-esr**: Navegador web.<br>
**kitty**: Emulador de terminal preferido.<br>
**zsh**: Es una shell mucho más completa que la típica *bash*.<br>
**zsh-autosuggestions** y **zsh-syntax-highlighting**: Complementos para *zsh* que veremos más adelante.<br>
**compton**: Compositor de ventanas. Actualmente se recomiendo cambiar a *picom*, pero soy un tio de viejas costumbres.<br>
**rofi**: Lanzador de APPs.<br>
**pulseaudio+pavucontrol**: Van de la mano y sirven para gestionar el audio.<br>
**polybar**: Sirve para crear *barras de tareas super hackers* en el escritorio.<br>
**feh**: Manipulador de imágenes.<br>
**flameshot**: Capturas de pantalla.<br>
**ranger**: Explorador de archivos de terminal.<br>
**thunar**: Explorador de archivos gráfico.<br>
**git**: Aplicación para gestionar *Github*.<br>
**telegram-desktop**: Aplicación de escritorio de Telegram.

<br>Una vez instalado todo, vamos a dar permisos de **sudo** a nuestro usuario para dejar de utilizar *root*.<br>

Para ello, vamos a añadir a nuestro usuario principal al grupo **sudo** de la siguiente manera:<br>
```console
root@debian:~# usermod -aG sudo sami
```
<br>
Como somos *hackers* y **gnome** es demasiado gráfico, vamos a instalar otro entorno de escritorio más *PRO*, como **i3**.<br>
Gracias al señor **https://github.com/maestrogerardo/** tenemos un script que hasta un mono podría instalar de la siguiente manera:
<br>
***<center>DARLE 'ENTER' TODO EL RATO</center>***
<br>
```console
root@debian:~# git clone https://github.com/maestrogerardo/i3-gaps-deb.git
root@debian:~# cd i3-gaps-deb
root@debian:~# ./i3-gaps-deb
```
<br>
*Solo nos queda reiniciar el sistema y rezar por que no explote nada.*
<hr>
## <br><center>Archivos</center><br>
Hemos instalado todo y tenemos reiniciado el equipo.<br>
En la pantalla de login hemos elegido nuestro nuevo entorno **i3** y estamos en la ventanita negra que es más fea que un frigorifico por detrás.<br>
No preocuparse.<br>
Nos toca ponernos con los archivos de configuración de las aplicaciones que hemos instalado, que es lo que les va a dar el toque *hacker*.<br>
Por hacerlo lo más simple posible, nos vamos a descargar todos los archivos juntos y los vamos a ir colocando en las rutas siguientes:<br>
<br>
<hr>
*Pulsa [**AQUÍ**]("https://github.com/SamiInfoSec/samiinfosec.github.io/raw/master/assets/confFiles.tar") para descargar el comprimido con los ficheros*
<hr><br>
El contenido de la carpeta de **fonts** vamos a copiarlo en:<br>
***/usr/share/fonts/***<br><br>
El contenido de la carpeta **polybar** lo copiamos en:<br>
***/home/sami/.config/polybar/***<br><br>
El archivo **i3/config** lo metemos en la carpeta:<br>
***/home/sami/.config/i3/***<br><br>
Los archivos **.Xresources** y **.zshrc** van en:<br>
***/home/sami/***<br><br>
El contenido de la carpeta **kitty** va en:<br>
***/home/sami/.config/kitty/***<br><br>
El archivo **compton.conf** lo metemos en:<br>
***/home/sami/.config/***<br><br>

Vamos a instalar ahora una *herramienta* que acabo de descubrir y cumple mis dos requisitos, funcional y estética, ***powerlevel10k***.<br>
Gracias a otro grande **https://github.com/romkatv/** tenemos una maravilla que se complementa de lujo con *zsh*.<br>
```console
sami@debian:~$ git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
sami@debian:~$ echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
```
<br>
No voy a postear cómo configurar *powerlevel10k* por que es muy personal y es ir eligiendo opciones, seréis capaces de hacerlo, no preocuparse.<br>
¿Y si os digo que pulsando dos veces **ESC** podéis poner la palabra **sudo** delante de vuestro comando?<br>
Con lo que se me olvida poner el puto *sudo* a mi, me viene increible.<br>
Solo hace falta bajarnos el script y meterlo en la carpeta:<br>
***/usr/share/zsh-sudo/***<br>
```console
sami@debian:~$ wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh
```
<br>
Si nos aparece algún error en estos archivos, todo es cuestión de cambiar **rutas** y/o nombres de **usuario**.<br>
*Con reiniciar las aplicaciones tras copiar los archivos es suficiente, pero como dudo de las capacidades individuales, vamos a reiniciar el sistema para que se
ponga todo solito.*
<hr>

## <br><center>Combinaciones</center><br>
Ya hemos aterrizado en nuestro precioso sistema pero no sabemos ni abrir una terminal.<br>
Como consejo, os recomiendo cacharrear con los archivos de configuración que hemos copiado y leerlo y tocarlo todo, sin miedo, que si rompéis algo, podéis volver a copiarlos.<br>
Aquí os dejo una pequeña guía inicial con las combinaciones más útiles que debéis conocer:<br><br>
**Win+Enter**: Abrir una terminal.<br>
**Win+[1,2,3,4,5,6,7,8]**: Cambio de escritorio.<br>
**Win+0**: Menú del sistema.<br>
**Win+D**: Menú rofi para lanzar aplicaciones.<br>
**Win+F**: Abrir firefox.<br>
**Win+T**: Abrir telegram.<br>
**Win+[H,V]**: Cambiar la orientación de las ventanas.<br>
**Win+R**: Redimensionar tamaño de las ventanas. (Pulsar ESC al acabar)<br>
**Win+Shift+[1,2,3,4,5,6,7,8]**: Mover ventana a otro escritorio.<br>
**Win+Q**: Cerrar la ventana.<br>

## <br><center>Resultado</center><br>
Aquí os dejo unas fotitos de cómo debe quedar si lo habéis hecho todo bien.<br>
Cualquier distancia con la realidad es solo culpa vuestra.<br>
*Cualquier problema, podéis poneros en contacto conmigo y os echo una mano encantado <3*<br>
<center><img src="https://raw.githubusercontent.com/SamiInfoSec/samiinfosec.github.io/master/assets/images/desktopBlog.png"></center>
