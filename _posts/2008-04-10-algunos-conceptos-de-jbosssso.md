---
title: "Algunos Conceptos de JBossSSO"
date: 2008-04-10 19:04:02 +0000
permalink: /2008/04/10/algunos-conceptos-de-jbosssso/
description: "Los siguiente son conceptos que se iran refinando con mi entendimiento en el tema: SSOTokenManager extiende de ValveBase.."
tags:
  - "Java"
original_url: https://www.salaboy.com/2008/04/10/algunos-conceptos-de-jbosssso/
---

Los siguiente son conceptos que se iran refinando con mi entendimiento en el tema: SSOTokenManager extiende de ValveBase.. es decir que ejecuta su metodo invoke cada vez que se hace un request.. Y como su documentacion dice intercepta todos los request en busca de la presencia de un SSOToken domain cookie.. Si el usuario se encuentra logueado (EL principal esta seteado) y la cookie no existe, crea una para el resto de la session.

SSOAutoLogin es un autenticador de tipo form que intercepta los request y busca la presencia de un SSOTOken domain cookie. Si existe la cookie se procesa y el pricipal es generado resultando en un Autologin. SSOAutoLogin Tambien exitiende de ValveBase

Si SSOAutologin no encuentra la cookie entonces se procede al metodo de autenticacion normal. Llevada acabo por la clase UsernameAndPasswordLoginModule que exitiende de UsernamePasswordLoginModule. Y esta es la encargada de soportar la autenticacion mediante username y password.

Esto esta definido en el web-inf de la aplicacion web en el archivo context.xml

Vamos a ver el flujo normal de las Valves en el camino del primer request a nuestra aplicacion de prueba:

1. SSOFederationRouter:

- Levanta la lista de partners  (usa un metodo llamado lookupPartners(request))
  - Este metodo agarra el nombre del server que se encuentra en el request y el puerto y busca la lista de partners en /federate/partners la cual parsea a continuacion, ya que este devuelve el XML de partners que tiene todos los partners  que estan en el archivo de configuracion llamado: server.cfg.xml dentro del federation-server.sar/conf/. Solamente trae los partners, es decir los distintos federation server que hay configurados. por lo tanto se ven de la forma: http://node1.jboss.com:8443/federate y http://node1.jboss.org:8443/federate
- Busca una variable dentro del request llamada **referer** y luego si la encuentra ... TODO
- Continua con la cadena de Valves

2) SSOAutoLogOut

- Busca la session de SSOSession y si no encuentra ninguna crea un objeto SSOSession Nuevo (metodo SSOSession.getSSOSession())
- Luego con la clase auxiliar SSOUtil va a buscar un token SSO en el request. Este token lo busca en las cookies (metodo SSOUtil.getSSOToken())
- Si no encuentra el token pasa al siguiente valve en la cadena
- Si encuentra el token pone en true la flag llamada ssoCookieFound y continua la ejecucion en la siguiente cadena

3) SSOTokenManager

- Va a buscar el token con la clase SSOUtil.
- Va a buscar la cookie con Tool.isCookieFound()
- Va a buscar si estamos en el medio del proceso de LogOut mediante la busqueda de un cookie llamada LOGOUT_TOKEN
- Va a buscar una SSOSession y si no la encuentra crea una nueva
- Pregunta si el usuario esta loggeado y la cookie no se ha procesado para realizar el login automatico y setea un flag para que no se realicen autologins
- Si la cookie no se encuentra le pone un null a SSOSession.setTurOff
- Continua con el siguiente valve en la ejecucion a pesar de tener codigo todavia para ejecutar.

4) SSOAutoLogin

- Va a buscar una session y si no la encuentra crea una nueva SSOSession
- BUsco en la session que tengo tiene en la propiedad getTurnOff null tengo que realizar SSO (performSSO=true)
- Si performSSO llamamos al metodo performSSO(request,response)
  - Este metodo va y busca un token llamado SSO_SECURE_TOKEN
  - Si encuentra este token lo valida y setea el flag de que encontro la cookie
  - en caso de no ser valido fueza el logout
  - Si la cookie se encontro el flag fue seteado en true
    - Setea los atrivbutos SSO_USERNAME con el usuario obtenido del Principal igualmente con el SSO_PASSWORD
    - Ejecuta el autologin (metodo ssoLogin(request,response,config))
    - Si este metodo devuelve true, setea el principal en la SSOSession
  - Si la cookie no se encontro devuelve false
- Llamamos a la siguiente Valve en la cadena, si se realizo el autologin solamente va a pasar al siguiente????????????????
- Sino se realizo el SSOPerformed:
  - Como no se ejecuto el SSO ejecutar authentication mediante FORM

Una vez llegado al final de la ejecucion del Valve numero 4 en este caso SSOAutoLogin la cadena vuelve por el Valve numero 3 llamado SSOTokenManager a ejecutar el codigo que sigue a continuacion:

3. SSOTokenManager:

- Trata de obtener el principal, si lo encuentra pregunta si no se encontro la cookie, de cumplirse que tenemos un principal y no la cookie
  - Obtiene del dominio y creo que genera una cookie o manda un mensaje con saml para uqe se genere
- Si el principal es null , verifica si existe la cookie borra/limpia el token ya que no deberia existir

2) SSOAutoLogout: no hace nada ya habia terminado de ejecutar todo su codigo

1. SSOFederationRouter: no hace nada

Este recorrido en el request inicial lo va a hacer 4 veces ya que la pagina del test tiene 3 imagenes (es decir el 1 por el archivo html y 3 por las imagenes)

Los Valves tiene memoria por session de usuario, por lo tanto en el SSOFederationRouter no tienen que ir a buscar los partners todas las veces.

Ahora vamos a ver el request cuando nos authenticamos por primera vez a la aplicacion web, la idea es ver donde se crea el principal (en que request) y cuando afecta al flujo de la ejecucion de los Valves:

1. SSOFederationRouter:

- ahora si encuentra la variable Referer que indica la pagina de donde venimos: en este caso /secure/index.jsp
- Esta es la parte donde averigua  si de donde vengo estoy en un miembro de la federacion
- Como este es distinto de null, arma un objeto URL con el referer
- Luego compara si el referer domain es distinto al mydomain (ServerDomian) y verifica que dentro de los partners alguno tenga el dominio de referer. En caso de ser distintos setea un flag routing=true. En este caso se comparan los dominios y no los hosts, estos seria comparar jboss.com con jboss.org
- Si no se routea y son iguales los dominios (refererDomain y myDomain) entonces verifica si los hosts no son iguales (es decir el serverhost y el refererHost). En caso de ser iguales se setea el flag routing=true
- En el caso de que haya que routear hacemos:
  - TODO!!!!!!!!
- Continua la ejecucion con el siguiente Valve en la cadena

2) SSOAutoLogOut:

- Se comporta exactamente igual que cuando entramos por primera vez

3) SSOTokenManager

- Se comporta exactamente igual que cuando entramos por primera vez en el pagina

4) SSOAutoLogin

- Se comporta exactamente igual que cuando entramos por primera vez, pero cuando llamo al siguiente Valve en la cadena se encuentra con la "pagina" de autenticacion de JAAS.

En este punto llegamos a la  "pagina" que hace el login real por JAAS, (todavia no emprendemos la vuelta por la cadena de Valves), pero se realiza la Autenticacion y una vez que esto termina se vuelve por las Valves.

La autenticacion cae por medio de JAAS a la clase UsernameAndPasswordLoginModule.java al metodo initialize() el cual llama al metodo initialize() de la super clase que pertenece al paquete de javax.authenticacion.spi...... Este metodo levanta todas las opciones que definimos en el archivo: security-config.xml que define que LoginModule vamos a usar para un security-domain especifico (el cual especificamos en la aplicacion web de test)

Luego de esto vamos a pedir el userPassword con el metodo UsernameAndPasswordLoginModule.getUserPassword()

- Le pregunta al provider si el usuario existe pasandole el nombre de usuario (que supuestamente se seteo en el initialize del padre)
- Si existe se lee desde el provider el Identity (objeto Identity)
- Valida si el identity esta activo o no.
- Con esto obtiene el password encritapdo y lo devuelve

Luego vamos a buscar los Roles, para lo cual se realizan pasos muy similares a la obtencion del password. ver detalles.. itera sobre los grupos y sobre los roles definidos en el xml.

Ahora volvemos por la cadena hacia atras para devolverle el control al usuario junto con el response:

4. SSOAutoLogin:

- Preguntamos si se efectuo SSO, en este caso no.
- Pregunta si existe el principal y al parecer no se ha seteado todavia

3) SSOTokenManager:

- Va devuelta a buscar el princpial, pero le sigue dando null
- Pregunta si la cookie se encontro
- Continua

2) SSOAutoLogout: no hace nada

1. SSOFederationReouter: no hace nada

En esta etapa el security_check de JAAS termino exitoso y ahora trata de forwardear a la pagina de inicio de nuestra aplicacion

Ahora volvemos a tener otro ciclo de invocaciones a las Valves ya que ahora tenemos creados los principals.

1. SSOFederationRouter:

- El referer sigue siendo el mismo ya que la validacion de JAAS fue toda server side.. por lo tanto es: secure/index.jsp
- hace las comparaciones de dominios y hosts por lo tanto routing=false
- como no hay que hacer routing llama al siguiente Valve

2) SSOAutoLogout: hace lo mismo que en las rondas anteriores

3. SSOTokenManager:

- SSotoken=null, cookiefound=null, logoutinprogres=null
- SessionSSo nuevo
- Llama al siguiente valve

4) SSOAutoLogin:

- SSOSession nuevo
- No se hace SSO
- Llama a el siguiente Valve, no hay mas en la cadena
- Como No se ejecuto SSO vamos a buscar el principal , aca esta el principal (hay que tener cuidado si estamos debuggeando de que no se nos muera la session porque sino el principal se pone en null)
- Crea un SSOSession y le setea el principal

Volvemos por la cadena de valves:

3. SSOTokenManager:

- Vamos a buscar el principal, si no encontramos la cookie
- Crea la cookie a nivel de dominio (es decir para el dominio)
- Para esto hace Util.sednSSOToken()
  - Genera el token SAML
  - Crea la cookie TOKEN con el dominio y el path
  - Crea el cookie SECURE_TOKEN le agrega el TOKEN
  - Y esto se agrega el RESPONSE HTTP
- No esta la cookie

2) SSOAutoLogout: no hace nada

1. SSOFederationRouter: no hace nada

En este punto ya tenemos los TOKEN y SECURE_TOKEN Seteados

Para que las proximas llamadas lo utilicen.
