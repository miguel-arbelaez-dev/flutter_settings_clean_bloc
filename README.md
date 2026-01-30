# Flutter Settings – Clean Architecture + BLoC

Este proyecto es una aplicación Flutter que implementa una **feature real de Ajustes (Settings)** utilizando **Clean Architecture**, **BLoC** para la gestión de estado global y **persistencia local** mediante SharedPreferences.

El objetivo principal del proyecto es demostrar **buenas prácticas de arquitectura**, separación de responsabilidades, escalabilidad y testeo, tal como se espera en aplicaciones móviles de producción.

---

## Descripción

La aplicación permite al usuario seleccionar el tema de la app entre tres opciones:

- Light
- Dark
- System

La preferencia seleccionada:
- Se maneja como **estado global**
- Se persiste localmente
- Se restaura automáticamente al reiniciar la aplicación
- Se aplica a toda la UI de forma reactiva

La pantalla de ajustes está diseñada siguiendo patrones reales de aplicaciones Android e iOS, con una estructura modular y widgets reutilizables.

---

## Arquitectura

El proyecto sigue **Clean Architecture**, separando el código en tres capas bien definidas:


### Domain
- Contiene la lógica de negocio pura
- Define entidades (`AppTheme`)
- Define contratos de repositorios
- Implementa casos de uso (`GetTheme`, `SetTheme`)
- No depende de Flutter ni de librerías externas

### Data
- Implementa los repositorios definidos en domain
- Usa un datasource local basado en SharedPreferences
- Maneja el mapeo entre modelos y entidades
- Está completamente desacoplada de la UI

### Presentation
- Contiene la UI y la gestión de estado
- Usa **BLoC** para manejar eventos y estados
- La UI reacciona únicamente a cambios de estado
- Los widgets están separados por responsabilidad

---

## Gestión de estado

- Se utiliza **flutter_bloc**
- Un `SettingsBloc` controla el estado global del tema
- Los eventos representan acciones del usuario
- Los estados representan el estado actual de la configuración

---

## Persistencia

- Se utiliza **SharedPreferences**
- El acceso al almacenamiento está abstraído mediante un servicio
- La implementación puede ser reemplazada fácilmente por otra fuente de datos

---

## Testing

El proyecto incluye un **test unitario del SettingsBloc** que valida:

- Emisión correcta de estados
- Respuesta correcta ante eventos
- Comportamiento predecible del flujo de negocio

Los tests están escritos usando `bloc_test` y `mocktail`.

---

## Tecnologías y versiones

- Flutter: **3.38.7**
- Dart: **3.x**
- flutter_bloc: ^8.1.4
- bloc_test: ^9.1.5
- mocktail: ^1.0.3
- shared_preferences: ^2.2.3
- test: ^1.24.9

---

## Cómo ejecutar el proyecto

```bash
flutter pub get
flutter run
