# Monitor de apovicionamiento 
Valida el estado de aprovicionamiento del equipo.

## Compatibilidad
Netbook Educativa Noblex SF20GM7

## Instalación
Para instalar la herramienta y sus dependencias ejecute los siguientes comandos y pasos:

``sudo chmod x+ install.sh``

``./install.sh``

*Nota: no ejecutar la instalación como ``sudo`` o ``root``*

Luego de finalizada la instalación, espere unos segundos, se mostrara la ventana de configuración de TD+ y siga los siguientes pasos:
1. Seleccione la pestañan "Configuración".
2. Presione sobre el boton "Editar".
3. Introduzca la dirección ``citd.dgp.educ.ar``.
4. Presione "Guardar".

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
