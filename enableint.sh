#!/usr/bin/expect -f
set timeout 20
set IPaddress [lindex $argv 0]


###---------------CREDENCIALES ACTUALES---------------------------------
set Username "usuarioactual"
set Password "claveactual"

###---------------LOGS---------------------------------
set Directory /home/kali/Scripts/Cambio-claves-redes/
log_file -a $Directory/session_$IPaddress.log
send_log "### /START-SSH-SESSION/ IP: $IPaddress @ [exec date] ###\r"

###---------------ACCESS---------------------------------
spawn ssh $Username@$IPaddress

###---------------RELACION---------------------------
#sleep 1
#expect "(yes/no)?"
#send "yes\r"
#send "$^C"
#send "exit\r"

###---------------LOGIN-2---------------------------------
#expect "*assword:"
#send "$Password\r"
#expect "*#"

###---------------TAREAS---------------------------

#send "show running-config\r                                                                                 \r"
#expect "*#"

#send "sh ver | include System image\r"
#expect "*#"

#send "sh version | include Produc\r"
#expect "*#"

#send "sh version | include Model\r"
#expect "*#"

#send "clear logging\r\r"
#expect "*#"

###---------------CAMBIO DE CLAVE - PARTE 1---------------------------

#send "conf t\r"
#expect "*#"

#send "username usuarionuevo privilege 15 secret clavenueva\r\r"
#expect "*#"

#send "enable secret clavenueva\r\r"
#expect "*#"

#send "no username usuarioanterior\r\r"
#expect "*#"

#send "exit\r"
#expect "*#"

###---------------TAREAS CONF---------------------------

#send "conf t\r"
#expect "*#"

#send "service timestamps log datetime localtime\r\r"
#expect "*#"

#send "exit\r"
#expect "*#"

###---------------GUARDAR - PARTE 2 ----------------------------------

#send "sh clock\r"
#expect "*#"

#send "wr\r"
#expect "*#"

###---------------FINALIZAR--------------------------
send "\r"
expect "*#"
#send "\r\r"
#expect "*#"

###---------------EXIT---------------------------
send "exit\r"
send_log "\r### /END-SSH-SESSION/ IP: $IPaddress @ [exec date] ###\r"
exit