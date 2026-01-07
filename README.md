### Ejecución local en emulador o dispositivo
>Nota: Solo se ha probado en dispositivos Android
Sigue estos pasos para ejecutar la app en tu entorno local:

1. **Requisitos previos**
	- Tener instalado [Flutter](https://docs.flutter.dev/get-started/install) (SDK 3.8.0 o superior).
	- Tener instalado Android Studio, VS Code o Xcode (para iOS).
	- Tener configurado un emulador Android/iOS o un dispositivo físico conectado.
	- (Opcional) Instalar las extensiones recomendadas de Flutter y Dart en tu editor.

2. **Clona el repositorio**
	```bash
	git clone https://github.com/alvaroluca/DogfyDiet.git
	```

3. **Instala las dependencias**
	```bash
	flutter pub get
	```

4. **(Opcional) Genera archivos de código**
	Si modificas modelos Freezed, ARB de localización o generadores, ejecuta:
	```bash
	flutter pub run build_runner build --delete-conflicting-outputs

	flutter gen-l10n
	```

5. **Configura un emulador o conecta un dispositivo**
	- Abre un emulador Android/iOS desde tu IDE o conecta un dispositivo físico por USB.

6. **Ejecuta la app**
	```bash
	flutter run
	```
	Esto compilará y lanzará la app en el emulador/dispositivo conectado.

#### Configuración recomendada para launch.json (VS Code)

El archivo `.vscode/launch.json` está preparado para lanzar la app en diferentes modos (`debug`, `profile`, `release`).
Tienes configuraciones predefinidas para cada combinación, facilitando el desarrollo y las pruebas.

```jsonc
{
	"version": "0.2.0",
	"configurations": [
		{
			"name": "Dogfy Diet (debug)",
			"request": "launch",
			"type": "dart",
			"program": "${workspaceFolder}/lib/main.dart",
			"flutterMode": "debug"
		},
		{
			"name": "Dogfy Diet (profile)",
			"request": "launch",
			"type": "dart",
			"program": "${workspaceFolder}/lib/main.dart",
			"flutterMode": "profile"
		},
		{
			"name": "Dogfy Diet (release)",
			"request": "launch",
			"type": "dart",
			"program": "${workspaceFolder}/lib/main.dart",
			"flutterMode": "release"
		}
	]
}
```
Puedes seleccionar cualquiera de estas configuraciones desde el menú de ejecución de VS Code para lanzar la app en el modo y entorno deseado.



### Cómo ejecutar los tests

Puedes ejecutar los tests unitarios y de widgets con los siguientes comandos desde la raíz del proyecto:

**1. Ejecutar todos los tests:**
```bash
flutter test
```
Esto ejecuta todos los tests unitarios y de widgets definidos en la carpeta `test/`.

**2. Ejecutar tests de un archivo concreto:**
```bash
flutter test test/features/onboarding/presentation/steps/dog_name_step_test.dart
```

**3. Ver la cobertura de tests:**
```bash
flutter test --coverage
```
Esto genera un informe de cobertura en `coverage/lcov.info`.

**4. Formatear el código antes de testear (opcional):**
```bash
dart format .
```

**Notas:**
- Los tests están organizados por dominio y tipo en la carpeta `test/`.
- Puedes usar extensiones de VS Code para lanzar tests individuales desde el editor.


## 📁 Estructura de carpetas detallada

```text
lib/
├── core/                         # Núcleo de la app (configuración y servicios compartidos)
│   ├── config/                   # Temas, helpers y configuración global
│   ├── constants/                # Constantes globales
│   ├── di/                       # Inyección de dependencias (get_it)
│   ├── l10n/                     # Localización (ARB, AppLocalizations, gen-l10n)
│   ├── routes/                   # Definición de rutas y navegación (GoRouter)
│   ├── types/                    # Tipos y enums compartidos
│   └── widgets/                  # Widgets reutilizables entre features (AppBar, botones, etc.)
│
├── features/                     # Módulos de funcionalidad
│   ├── home/                     # Pantalla principal
│   │   └── presentation/         # UI y lógica de presentación de home
│   │       ├── pages/            # Páginas principales de home
│   │       └── widgets/          # Widgets específicos de home
│   │
│   ├── onboarding/               # Flujo de onboarding del perro
│   │   ├── data/                 # Capa de datos (repositorios, datasources, modelos)
│   │   ├── domain/               # Capa de dominio (entidades, repositorios, usecases)
│   │   └── presentation/         # Capa de presentación (BLoC/Cubits + UI)
│   │       ├── bloc/             # OnboardingBloc y sus eventos/estados
│   │       ├── cubit/            # Cubits generales de onboarding
│   │       ├── pages/            # Páginas principales del flujo de onboarding
│   │       ├── steps/            # Steps del flujo (DogName, BirthDate, Weight, etc.)
│   │       └── widgets/          # Widgets reutilizables dentro de onboarding
│   │
│   └── top_blocs/                # BLoCs globales (ej. idioma) y MultiBlocProvider raíz
│
└── test/                         # Tests unitarios, de widgets y de integración
	├── features/                 # Tests organizados por feature
	│   ├── home/                 # Tests de home
	│   └── onboarding/           # Tests de onboarding (steps, cubits, bloc, etc.)
	└── utils/                    # Helpers y utilidades comunes para tests
```

## 🏗️ Arquitectura y decisiones de diseño
Este proyecto sigue los principios de **Clean Architecture** y DDD (Domain-Driven Design) para garantizar mantenibilidad, escalabilidad y testabilidad. Las principales decisiones y patrones son:

- **Separación por capas:**
	- `lib/core/`: Núcleo de la app (configuración global, rutas, localización, DI, temas, tipos, servicios y widgets compartidos).
	- `lib/features/`: Módulos de funcionalidad (onboarding, home, etc.), cada uno organizado internamente en:
		- `data/`: Capa de datos (repositorios, datasources, modelos/DTOs).
		- `domain/`: Capa de dominio (entidades, contratos de repositorio, casos de uso).
		- `presentation/`: Capa de presentación (BLoC/Cubits, páginas, steps y widgets de UI).

- **Gestión de estado:**
	- Uso de **Bloc/Cubit** (flutter_bloc) para aislar la lógica de negocio de la UI.
	- Estados y eventos modelados con **Freezed** para inmutabilidad y exhaustividad.

- **Navegación:**
	- **GoRouter** para rutas declarativas y navegación robusta.

- **Internacionalización:**
	- Soporte multilenguaje con ARB y generación automática (`gen-l10n`).
    - Por defecto está en español. Para usar el idioma del dispositivo hay que quitar la siguiente línea de `main.dart` 
    ```bash
    locale: state.locale,
    ```

- **Persistencia local:**
	- **SharedPreferences** para guardar el progreso del onboarding y preferencias.

- **Inyección de dependencias:**
	- **get_it** para desacoplar la creación de objetos y facilitar el testeo.

- **Tests:**
	- Tests unitarios, de widgets y de integración, organizados por dominio y feature.

Esta estructura permite que cada capa evolucione de forma independiente y que la lógica de negocio sea fácilmente testeable y reutilizable.

## 📸 Screenshots y grabaciones
![Grabación de pantalla](screenshots/record.mp4)
![Home](screenshots/home.jpg)
![Onboarding Step 1](screenshots/onboarding_step_1.jpg)
![Onboarding Step 2](screenshots/onboarding_step_2.jpg)
![Onboarding Step 3](screenshots/onboarding_step_3.jpg)
![Onboarding Step 4](screenshots/onboarding_step_4.jpg)
![Onboarding Step 5](screenshots/onboarding_step_5.jpg)
![Onboarding Step 6](screenshots/onboarding_step_6.jpg)
![Onboarding Step 7](screenshots/onboarding_step_7.jpg)
![Onboarding Step 8](screenshots/onboarding_step_8.jpg)
![Onboarding Step 9](screenshots/onboarding_step_9.jpg)
