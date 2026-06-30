# 🍳 Recip4U – iOS App

**Descripción:**  
Aplicación nativa de iOS desarrollada en Swift que consume la API de DummyJSON para mostrar un catálogo de recetas. Permite ver detalles completos con ingredientes, instrucciones paso a paso, dificultad con colores dinámicos, búsqueda en tiempo real y navegación entre pantallas.

---

## 📌 Funcionalidades

### 🔹 v1.0 - Estructura inicial y API
- Configuración de arquitectura MVC con carpetas organizadas (Data, Utils, Views, ViewsCells, ViewsControllers)
- Consumo de API REST con **async/await** (URLSession)
- Modelos de datos con **Codable** y **CodingKeys**
- Carga asíncrona de imágenes desde URL con extensión de `UIImageView`

### 🔹 v1.1 - Lista de recetas
- Lista de recetas con **UITableView**
- Celda personalizada (`RecipeViewCell`) con imagen y nombre
- Navegación a pantalla de detalle mediante **segue show**
- Integración con **NavigationController** y título "Recipes"

### 🔹 v1.2 - Búsqueda en tiempo real
- Barra de búsqueda con **UISearchController** integrada en la barra de navegación
- Filtrado local en tiempo real mientras se escribe (`textDidChange`)
- Búsqueda por API al pulsar "Buscar" y al pulsar "Cancelar"
- Botón "X" restaura la lista completa instantáneamente

### 🔹 v1.3 - Pantalla de detalle completa
- Pantalla de detalle con **ScrollView** para contenido largo
- Imagen, nombre, tipo y dificultad de la receta
- **Color dinámico** según dificultad:
  - 🟢 Easy → Verde
  - 🟡 Medium → Amarillo
  - 🔴 Hard → Rojo
- Lista de ingredientes con viñetas
- Lista de instrucciones con viñetas
- Separador visual entre metadata y contenido
- Auto Layout completo con constraints dinámicos

---

## 🛠 Tecnologías utilizadas

- **Swift** / **UIKit**
- **async/await** (URLSession)
- **UITableView** + Celda personalizada
- **UISearchController** (búsqueda en tiempo real)
- **UIScrollView** (scroll de contenido largo)
- **Codable** + **CodingKeys**
- **Auto Layout** (Storyboard con constraints)
- **Extensiones** de UIKit (`UIImageView+NetworkLoading`)
- **MVC** (Model-View-Controller)

---

## 📷 Capturas de pantalla

### 🟢 v1.0 – Lista de recetas
<p align="center">
  <img src="screenshots/list.png" width="250">
  <img src="screenshots/search.png" width="250">
</p>

### 🔵 v1.1 – Pantalla de detalle
<p align="center">
  <img src="screenshots/detail.png" width="250">
  <img src="screenshots/difficulty_colors.png" width="250">
</p>

### 🟣 v1.2 – Ingredientes e instrucciones
<p align="center">
  <img src="screenshots/ingredients.png" width="250">
  <img src="screenshots/instructions.png" width="250">
</p>

---

## 📌 Estado del proyecto

El proyecto ha evolucionado en cuatro versiones principales:

| Versión | Estado | Funcionalidades |
|---------|--------|-----------------|
| v1.0 | ✅ Completado | Estructura + API + Modelos |
| v1.1 | ✅ Completado | Lista + Celda + Navegación |
| v1.2 | ✅ Completado | Búsqueda local + API |
| v1.3 | ✅ Completado | Detalle completo + Colores + Scroll |
| v2.0 | 🚧 En desarrollo | Favoritos con Core Data / UserDefaults |

---

## 📁 Estructura del proyecto

```
Recip4U/
├── Data/
│   ├── RecipeApi.swift              // Llamadas a la API con async/await
│   └── RecipeDto.swift              // Modelos Codable + CodingKeys
├── Utils/
│   └── UIImageView+NetworkLoading.swift  // Extensión para cargar imágenes
├── ViewsCells/
│   └── RecipeViewCell.swift         // Celda personalizada con imagen y nombre
├── ViewsControllers/
│   ├── ListViewController.swift     // Lista + Búsqueda + Navegación
│   └── DetailViewController.swift   // Detalle completo de receta
└── Views/
    └── Main.storyboard              // Storyboard principal con las vistas
```

---

## 📝 Lo que aprendí

- Consumo de API REST con `async/await`
- Manejo de `UITableView` con celdas personalizadas y `dequeueReusableCell`
- Implementación de **UISearchController** para búsqueda en tiempo real
- Manejo de imágenes asíncronas con `DispatchQueue.global`
- Navegación entre pantallas con **NavigationController** y `prepare(for:sender:)`
- Uso de **CodingKeys** para mapear JSON con nombres distintos (`cuisine` → `type`)
- Auto Layout con **ScrollView** y constraints dinámicos para contenido variable
- Formateo de listas con `map` y `joined(separator:)`
- Colores dinámicos con `switch` y `UIColor`
- Organización de código en arquitectura **MVC**
- Extensiones de UIKit para reutilizar funcionalidad (`UIImageView+NetworkLoading`)

---

## 🚀 Cómo ejecutar

1. Clona el repositorio:

```bash
git clone https://github.com/GualpaJ/Recip4U.git
