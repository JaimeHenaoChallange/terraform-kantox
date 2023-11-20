# Jedi Locator - Cloud Technical Test

Estructura:

```console
jedi-locator
├── terraform
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── modules
│   │   ├── ...
├── serverless-function
│   ├── handler.py
│   ├── requirements.txt
├── README.md
|____
```

## Descripción

Este repositorio contiene la implementación de la prueba técnica para el Consejo Jedi. El objetivo es crear una solución en la nube para localizar y salvaguardar la ubicación de los Jedi secretos.

## Estructura del Proyecto

- `terraform/`: Contiene la configuración de Terraform para la infraestructura.
- `serverless-function/`: Contiene el código de la función sin servidor para manejar eventos.

## Configuración

### Terraform

1. Asegúrate de tener Terraform instalado.
2. Actualiza las variables en `terraform/variables.tf` según sea necesario.
3. Ejecuta `terraform init` y luego `terraform apply` para desplegar la infraestructura.

### Función sin Servidor

1. Implementa la función en tu proveedor de funciones sin servidor favorito.
2. Configura los eventos para desencadenar la función cuando se actualice el Manifiesto.

## Decisiones de Implementación

- **Encriptación**: Se utiliza la clave gestionada por el cliente (CMK) para la encriptación del ID del Jedi.
- **Arquitectura sin Servidor**: La solución es serverless para ser coste efectiva y escalable.
- **Event-Driven**: La arquitectura está diseñada para manejar eventos y registrar información cuando se recibe un nuevo Manifiesto.

## Pruebas

Realiza pruebas exhaustivas antes de implementar en un entorno de producción.

## Contribuciones

¡Las contribuciones son bienvenidas! Siéntete libre de abrir problemas o enviar solicitudes de extracción.

## Licencia

Este proyecto está bajo la licencia [MIT](LICENSE).