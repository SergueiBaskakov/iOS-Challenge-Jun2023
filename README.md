# Challenge - Recipes
"Recipes" is an iOS mobile application that displays a list of recipes, the details of each recipe, and their place of origin. The app consists of a package called "ChallengeComponents" which contains the main layers and components, and the project called "Challenge" which utilizes the "ChallengeComponents" package.

## Functionalities

  - Displays a list of recipes.
  - Recipes can be filtered by name or ingredient. When entering text in the search bar, the app will display recipes whose name or any of the ingredients' names match the entered text.
  - Pressing on a recipe opens a view with its details and a button that leads to the map view.
  - The map displays a pin indicating the origin location of the recipe.

## iOS and Swift Version

  - iOS 15+ (94% of iPhone users meet the requirement - https://developer.apple.com/support/app-store/)
  - Swift 5+

## Packages and Libraries

Swift Package Manager was used for package and library management.

### External Packages and Libraries Used

  - [Resolver](https://github.com/hmlongco/Resolver) (Dependency Injection)
  - [Kingfisher](https://github.com/onevcat/Kingfisher) (Image Loading)

## Architecture

A significant portion of the application code was created within a package named "ChallengeComponents" in the form of libraries to increase its reusability and independence.

### ChallengeComponents

The main layers of the application are located in the "ChallengeComponents" package:

  - Domain - contains models, use cases (protocols), repositories (protocols), and model and repository mockers.
  - Core - contains interactors (implementations of use cases).
  - Persistence - contains mappers, rest repositories (implementations of repositories), and the RestHandler class (created to facilitate service calls).
  - Recipes - contains views and view models related to the flow of displaying recipes, their details, and the recipe's origin map.
  - Utils - contains elements that could be used in various flows and views (styles, extensions, placeholders, navigation bar view, loader, etc.).
  - Test - contains unit tests.

### Challenge

"Challenge" is the project that uses the "ChallengeComponents" package and contains:

  - Development and production environment variables.
  - Resolver configuration.
  - The "ChallengeApp" (Recipes) app.
  - The contentView.
  - UITests.

## Tests

### Unit Tests

   - Unit tests were created for models, repositories, use cases, and view models.
   - Resolver was configured to inject mockers for some objects during tests.
   - Unit tests are located within the "ChallengeComponents" package since it contains all the elements to be tested.

### UI Tests

   - UI tests were created for the main application flows.
   - UI tests are located within the "Challenge" project.

## Additional Information

   - SwiftUI was used for view development.
   - All views have a preview that can be executed using the "Challenge_Development" scheme.

## Important!

The app use a backend mocked in [mockable.io](https://www.mockable.io/). If you want to run the app and the backend does not work, you need to create a Rest Mock in [mockable.io](https://www.mockable.io/) with "/recipes" path, GET verb. You can paste this JSON to the response body:
     
    [
    {
        "name": "Panqueques",
            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
            "image": "https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg",
            "ingredients": [
                "harina",
                "azucar",
                "fresa",
                "miel"
              ],
            "longitude": -77.042793000000003,
            "latitude": -12.046374
    },
    {
        "name": "Smoothie",
            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
            "image": "https://images.pexels.com/photos/1099680/pexels-photo-1099680.jpeg?auto=compress&cs=tinysrgb&w=800",
            "ingredients": [
                "yogurt",
                "fresa",
                "azucar",
                "arandano"
              ],
            "longitude": 37.618423,
            "latitude": 55.751244
    }
    ]

After that replace the "BASE_URL" in "SupportingFiles/Development" and "SupportingFiles/Production" by the base url of your mocked backend


# Challenge - Recetas

"Recetas" es una aplicacion movil iOS que muestra una lista de recetas, los detalles de cada una de estas y su ubicacion de origen. La app consiste de un paquete llamado "ChallengeComponents" que contiene las principales capas y componentes, y del proyecto llamado "Challenge" que utiliza el paquete "ChallengeComponents".

## Funcionalidades

  - Muestra una lista de recetas
  - Se puede filtrar las recetas por nombre o por ingrediente. Al colocar un texto en el buscador la app mostrara las recetas cuyo nombre o nombre de alguno de los ingredientes coincida con el texto colocado.
  - Al presionar una receta se abrira una vista con los detalles de esta y un boton que lleva a la vista del mapa.
  - El mapa muestra un pin indicando la ubicacion de origen de la receta.

## Version de iOS y Swift

  - iOS 15+ (94% de usuarios de iPhone cumplen con el requisito - https://developer.apple.com/support/app-store/)

  - Swift 5+

## Paquetes y librerias

  - Se utilizo Swift Package Manager para el manejo de paquetes y librerias

### Paquetes y librerias externas utilizadas

   - [Resolver](https://github.com/hmlongco/Resolver) (Inyeccion de dependencias)
   - [Kingfisher](https://github.com/onevcat/Kingfisher) (Carga de imagenes)

## Arquitectura

Gran parte del codigo de la aplicacion se creo dentro de un paquete llamado "ChallengeComponents" en forma de librerias con la finalidad de aumentar su reusabilidad e independencia.

### ChallengeComponents

Las principales capas de la aplicacion se encuentran en el paquete "ChallengeComponents":
    - Domain - contiene a los modelos, los casos de uso (protocolos), repositorios (protocolos) y los mockers de los modelos y repositorios.
    - Core - contiene a los interactors (implementaciones de los casos de uso).
    - Persistance - contiene a los mappers, los repositorios rest (implementaciones de los repositorios) y al RestHandler (clase creada para facilitar las llamadas a los servicios).
    - Recipes - contiene a las vistas y los viewmodels relacionados al flujo de mostrar las recetas, sus detalles y el mapa de origen de la receta.
    - Utils - contiene elementos que podrian utilizarse en diversos flujos y vistas (estilos, extensiones, placeholders, la vista de la barra de navegacion, loader, etc).
    - Test - contiene los unit tests.
    
### Challenge

"Challenge" es el proyecto que hace uso del paquete "ChallengeComponents", contiene:
    - Las variables del entorno de desarrollo y de produccion.
    - La configuracion de Resolver.
    - La app "ChallengeApp" (Recetas)
    - El contentView
    - Los UITests
    
## Tests

### UnitTests
    
  - Se creo unit tests para los modelos, repositorios, casos de uso y viewmodels.
  - Se configuro Resolver para inyectar mockers de algunos objetos durante las pruebas.
  - Los units tests se encuentran dentro del paquete "ChallengeComponents" ya que este contiene todos los elementos a testear.

### UITests
    
   - Se creo UITests para los principales flujos de la aplicacion.
   - Los UITests se encuentran dentro del proyecto "Challenge".
    
## Informacion adicional

   - Se utilizo SwiftUI para el desarrollo de las vistas.
   - Todas las vistas poseen un preview que puede ser ejecutado utilizando el esquema "Challenge_Development"
    
## Importante!

La app utiliza un mock backend creado en [mockable.io](https://www.mockable.io/). Si desea ejecutar la aplicacion y el backend no funciona, debera crear un Rest Mock en [mockable.io](https://www.mockable.io/) con:

   - "/recipes" path
   - GET verb
   - Puede pegar este JSON en response body:    
    
    [
    {
        "name": "Panqueques",
            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
            "image": "https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg",
            "ingredients": [
                "harina",
                "azucar",
                "fresa",
                "miel"
              ],
            "longitude": -77.042793000000003,
            "latitude": -12.046374
    },
    {
        "name": "Smoothie",
            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
            "image": "https://images.pexels.com/photos/1099680/pexels-photo-1099680.jpeg?auto=compress&cs=tinysrgb&w=800",
            "ingredients": [
                "yogurt",
                "fresa",
                "azucar",
                "arandano"
              ],
            "longitude": 37.618423,
            "latitude": 55.751244
    }
    ]

  Posteriormente debera reemplazar la variable "BASE_URL" en "SupportingFiles/Development" y "SupportingFiles/Production" por la url base de su mocked backend
