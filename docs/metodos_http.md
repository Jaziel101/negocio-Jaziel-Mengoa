# Métodos HTTP — Práctica con JSONPlaceholder

**API usada:** https://jsonplaceholder.typicode.com/posts  
**Herramienta:** Postman / Thunder Client / fetch  
**Nota:** JSONPlaceholder **simula** los cambios, no los guarda de verdad. Un GET posterior NO mostrará las modificaciones.

---

## 1. GET — Obtener recursos

**¿Para qué sirve?**  
Recupera información del servidor sin modificarla. Es el método más usado y no lleva body.

**Ejemplo real:**

- **URL:** `https://jsonplaceholder.typicode.com/posts/1`
- **Método:** GET
- **Body:** (ninguno)
- **Código de estado:** `200 OK`

**Respuesta:**
```json
{
  "userId": 1,
  "id": 1,
  "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
  "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum..."
}
```

---

## 2. POST — Crear recursos

**¿Para qué sirve?**  
Envía datos al servidor para crear un nuevo recurso. El body va en formato JSON.

**Ejemplo real:**

- **URL:** `https://jsonplaceholder.typicode.com/posts`
- **Método:** POST
- **Headers:** `Content-Type: application/json`
- **Body:**
```json
{
  "title": "Práctica Web III",
  "body": "Ejemplo de POST con JSONPlaceholder",
  "userId": 1
}
```
- **Código de estado:** `201 Created`

**Respuesta:**
```json
{
  "title": "Práctica Web III",
  "body": "Ejemplo de POST con JSONPlaceholder",
  "userId": 1,
  "id": 101
}
```

---

## 3. PUT — Reemplazar un recurso completo

**¿Para qué sirve?**  
Reemplaza **TODOS** los campos del recurso indicado. Si omites un campo, éste se pierde o queda nulo.

**Ejemplo real:**

- **URL:** `https://jsonplaceholder.typicode.com/posts/1`
- **Método:** PUT
- **Headers:** `Content-Type: application/json`
- **Body:**
```json
{
  "id": 1,
  "title": "Título reemplazado completamente",
  "body": "Body reemplazado completamente",
  "userId": 1
}
```
- **Código de estado:** `200 OK`

**Respuesta:**
```json
{
  "id": 1,
  "title": "Título reemplazado completamente",
  "body": "Body reemplazado completamente",
  "userId": 1
}
```

---

## 4. PATCH — Modificar parcialmente

**¿Para qué sirve?**  
Actualiza **solo los campos enviados**, dejando el resto intacto. Es ideal para cambios pequeños.

**Ejemplo real:**

- **URL:** `https://jsonplaceholder.typicode.com/posts/1`
- **Método:** PATCH
- **Headers:** `Content-Type: application/json`
- **Body:**
```json
{
  "title": "Solo cambio el título con PATCH"
}
```
- **Código de estado:** `200 OK`

**Respuesta:**
```json
{
  "id": 1,
  "title": "Solo cambio el título con PATCH",
  "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum...",
  "userId": 1
}
```
> Observa que `body` y `userId` **se mantienen intactos** porque no los enviamos.

---

## 5. DELETE — Eliminar recursos

**¿Para qué sirve?**  
Borra el recurso indicado del servidor. No lleva body.

**Ejemplo real:**

- **URL:** `https://jsonplaceholder.typicode.com/posts/1`
- **Método:** DELETE
- **Body:** (ninguno)
- **Código de estado:** `200 OK`

**Respuesta:**
```json
{}
```
> JSONPlaceholder devuelve un objeto vacío `{}` cuando elimina correctamente.

---

## 🔍 Diferencia entre PUT y PATCH

**PUT** reemplaza el recurso **completo**: si envío solo un campo, los demás se pierden o quedan vacíos, porque el servidor interpreta que ese es el nuevo estado total del recurso.

**PATCH** aplica una **modificación parcial**: solo se actualizan los campos que envío y el resto permanece igual, por lo que es más seguro para cambios pequeños.

En resumen: **PUT = "reemplaza todo"**, **PATCH = "cambia solo lo que envío"**.

---

## ⚠️ Aclaración final

JSONPlaceholder **simula** las operaciones POST, PUT, PATCH y DELETE: devuelve una respuesta como si hubiera funcionado, pero **no guarda los cambios**. Por eso, si haces un GET después de un PUT o DELETE, verás los datos originales sin modificar.

---

## 📊 Tabla resumen

| Método | ¿Para qué sirve? | ¿Lleva body? | Código de éxito | URL de ejemplo |
|---|---|---|---|---|
| **GET** | Obtener recursos | ❌ No | `200 OK` | `/posts/1` |
| **POST** | Crear un recurso | ✅ Sí | `201 Created` | `/posts` |
| **PUT** | Reemplazar todo el recurso | ✅ Sí | `200 OK` | `/posts/1` |
| **PATCH** | Modificar parcialmente | ✅ Sí | `200 OK` | `/posts/1` |
| **DELETE** | Eliminar un recurso | ❌ No | `200 OK` | `/posts/1` |