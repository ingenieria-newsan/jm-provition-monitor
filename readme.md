# Monitor de apovicionamiento 
Valida el estado de aprovicionamiento del equipo.

## Compatibilidad
Netbook Educativa Noblex SF20GM7

## Instalación
Para instalar la herramienta y sus dependencias ejecute los siguientes comandos y pasos:

``sudo chmod x+ install.sh``

``./install.sh``

*Nota: no ejecutar la instalación como ``sudo`` o ``root``*

Luego de finalizada la instalación, espere unos minutos, se iniciará el agente TD+ mostrando un icono en la barra del SO. Siga los siguientes pasos:
1. Haga click sobre el icono de TD+ y seleccione ``Open Theft Deterrent Plus Client``.
2. Seleccione la pestañan ``Settings``.
3. Presione sobre el boton ``Edit``.
4. Introduzca la dirección ``citd.dgp.educ.ar``.
5. Presione ``Save``.
6. Presione ``Test``.
7. Si todo resulto bien, debe ver el mensaje ``Connection is successful!``.
8. Presione ``Apply`` y cierre la ventana.

## Ejecutar
Para ejecutar la herramienta introduzca el siguiente comando:

``./monitor.sh``

## Dependencias
- Theft Deterrent Client v6.0.0.11
- Theft Deterrent Client Lib v6.0.0.11
- Theft Deterrent Guardian v6.0.0.11
- Theft Deterrent TPM Daemon v6.0.0.11
- Phyton
- Figlet
