# ¿Qué es Pandas?
Es una herramienta de análisis y manipulación de datos de código abierto rápida, potente, flexible y fácil de usar.

Proporciona una estructura diseñada para trabajar con datos relacionales y etiquetados de una manera intuitiva.

Es una de las librerías más utilizadas en Python y su nombre viene de panel data.

## Estructura del proyecto
```
|____README.md
|____docker-compose.yml
|____home
| |____jupyter_user_settings
| |____work
| | |____Datasets
|____Dockerfile
|____config
| |____requirements.txt
| |____startup
| | |____01-start.ipy
| | |____02-pandas.py 
```
* [home/work](./home/work/): El home del proyecto Jupyter. Aquí se guardarán todos los ficheros en los que trabajemos.
* [home/work/Datasets](./home/work/Datasets/): Datasets de pruebas. 
* [home/jupyter_user_settings](./home/jupyter_user_settings/): Ficheros de configuración de Jupyter. Si tenemos alguna configuración personalizada se guardará aquí y se montará como volumen en Docker. Con esto nos aseguramos que las configuraciones personalizadas no se pierden al borrar el contenedor.
* [config/startup](./config/startup/): En esta carpeta podemos poner scripts Python o de IPython para ejecutarlos al arrancar el kernel de Jupyter. Para que funcionen es necesario que empiecen con un número. Se cargarán por orden numérico. Ej: El script `01-start.ipy` se carga antes que el `02-pandas.py`.
    * [config/startup/01-start.ipy](./config/startup/01-start.ipy): Este fichero contiene los módulos a pre cargar de IPython cuando se arranque el Kernel de Jupyter.
    * [config/startup/02-pandas.py](./config/startup/02-pandas.py): Esto pre carga el módulo Pandas con unas personalizaciones. Al hacer esto ya tenemos el módulo accesible en cada Notebook sin tener que volver a importarlo.
* [config/requirements.txt](./config/requirements.txt): Fichero requirements de Pip donde pondremos todos los módulos a instalar en el contenedor de Jupyter.

## Instalación
1. [Instalar Docker](https://docs.docker.com/engine/install/)
2. Levantar el proyecto `docker compose up`
3. Acceder al entorno de desarrollo de JupyterLab a través de la URL: http://localhost:8888/lab/tree/work

## Instalar módulos nuevos
Para instalar módulos nuevos es necesario reconstruir el contener para hacerlos persistentes.
1. Añadimos el módulo en el fichero [config/requirements.txt](./config/requirements.txt)
2. Para los contenedores antiguos `docker compose stop`
3. Reconstruimos el contenedor y arrancamos el entorno: `docker compose up --build -d`