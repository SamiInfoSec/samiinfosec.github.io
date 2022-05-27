---
layout: post
title:  "Configurando Debian 11"
date:   2022-05-27
last_modified_at: 2022-05-27
categories: [Jekyll Paper]
tags: [Getting Start]
---

<br>
Como entusiasta del mundo Linux, he sido *distrohopper* mucho tiempo, y puedo asegurar que no hay nada como Debian. Pero para gustos, los culos.<br>
Si a esto le sumamos que me gusta tener un entorno de trabajo funcional y precioso a partes iguales, tras muchas peleas he conseguido mi configuración perfecta.<br>
Voy a dar todos los detalles para llegar al mismo punto, partiendo de una instalación de Debian literalmente **mínima**.
<br><br>*Si no sabes instalar Debian sin entorno gráfico, sal de este blog **[ahora mismo](https://google.es)**.*<br><br>

# <center>Contenido</center>
1. [Configuración Inicial](#configuracion_inicial)
2. [Instalando Paquetes](#instalando_paquetes)
3. [Archivos de Configuración](#archivos_de_configuracion)

## <center>Configuración_Inicial</center><br>
Primero vamos a ponernos como ***root***
```console
sami@debian:~$ su -
Contraseña: ******
root@debian:~#
```
<br>

Ahora, para tener más paquetes a nuestra disposición, vamos a editar el archivo <br>***/etc/apt/sources.list***<br>
Añadimos en cada uno de los repositorios las etiquetas de ***nonfree*** y ***contrib*** y debe quedar tal que así:

```console
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
```console
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
## <center>Instalando_Paquetes</center><br>
Vamos a instalar una serie de paquetes a mi gusto.
<br>Sois libres de eliminar o sustituir los paquetes similares a vuestro gusto, pero tened en cuenta que los archivos de configuración
que usaré en el post son diseñados para estos paquetes especificamente.
```console
root@debian:~# apt update
root@debian:~# apt install gnome sudo firefox-esr kitty zsh compton rofi pulseaudio pavucontrol polybar feh zsh-autosuggestions zsh-syntax-highlighting flameshot ranger thunar git
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
**polybar**: Sirve para crear *barras de tareas* en el escritorio.<br>
**feh**: Manipulador de imágenes.<br>
**flameshot**: Capturas de pantalla.<br>
**ranger**: Explorador de archivos de terminal.<br>
**thunar**: Explorador de archivos gráfico.<br>
**git**: Aplicación para gestionar *Github*<br>
<br>

Una vez instalado todo, vamos a dar permisos de **sudo** a nuestro usuario para dejar de utilizar root, práctica muy poco recomendable.
<br>
Para ello, vamos a añadir a nuestro usuario principal al grupo **sudo** de la siguiente manera:<br>
```console
root@debian:~# usermod -aG sudo sami
```
<br>
Como somos *hackers* y **gnome** es demasiado gráfico, vamos a instalar otro entorno de escritorio más *PRO*, como **i3**.<br>
Gracias al señor *https://github.com/maestrogerardo/* tenemos un script que hasta un mono podría instalar de la siguiente manera:
<br>
***<center>TAN SIMPLE COMO DARLE 'ENTER' TODO EL RATO</center>***
<br>
```console
root@debian:~# git clone https://github.com/maestrogerardo/i3-gaps-deb.git
root@debian:~# cd i3-gaps-deb
root@debian:~# ./i3-gaps-deb
```
<br>
Solo nos queda reiniciar el sistema y rezar por que no explote nada.

## <center>Archivos_de_Configuración</center><br>
Nos toca ponernos con los archivos de configuración de las aplicaciones que hemos instalado, que es lo que les va a dar el toque *hacker*.<br>
Por hacerlo lo más simple posible, nos vamos a descargar todos los archivos juntos y los vamos a ir colocando en las rutas siguientes:


