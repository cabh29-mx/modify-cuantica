diff --git a/README.md b/README.md
index 42dd2ef4f5fb32e5fe3c10f7cc3d9ea885507282..2d6ec1ee2c50afb76b07ee5b3f870f48fd02de40 100644
--- a/README.md
+++ b/README.md
@@ -1 +1,105 @@
-# cebrameta
\ No newline at end of file
+# cebrameta
+
+Automatización ADB para una **Xiaomi Pad 6** en modo "resonancia" (enfoque y calma).
+
+## ¿Cómo lo instalo?
+
+### 1) Instala ADB en tu computadora
+
+El script necesita `adb` (Android Platform Tools).
+
+- **Windows (winget):**
+  ```bash
+  winget install Google.PlatformTools
+  ```
+- **macOS (Homebrew):**
+  ```bash
+  brew install android-platform-tools
+  ```
+- **Ubuntu/Debian:**
+  ```bash
+  sudo apt update && sudo apt install -y adb
+  ```
+
+Verifica que quedó instalado:
+
+```bash
+adb version
+```
+
+### 2) Prepara la Xiaomi Pad 6
+
+1. Abre **Ajustes → Información de la tablet** y toca 7 veces en *Versión de MIUI/HyperOS* para activar opciones de desarrollador.
+2. Ve a **Ajustes → Ajustes adicionales → Opciones de desarrollador**.
+3. Activa **Depuración USB**.
+4. Conecta la tablet por USB a la PC y acepta el mensaje de huella RSA.
+
+Confirma conexión:
+
+```bash
+adb devices
+```
+
+Debe aparecer un serial con estado `device`.
+
+### 3) Ejecuta la instalación directa del perfil
+
+Desde la carpeta del repo:
+
+```bash
+./scripts/modo_resonancia_pad6.sh
+```
+
+También puedes usar el modo explícito:
+
+```bash
+./scripts/modo_resonancia_pad6.sh install
+```
+
+Acciones aplicadas durante la instalación:
+- Brillo manual bajo.
+- No molestar (DND) activo.
+- Modo nocturno + tono cálido activo.
+- Impresión de estado final de ajustes.
+
+## Comandos adicionales
+
+### Activar modo resonancia
+
+```bash
+./scripts/modo_resonancia_pad6.sh on
+```
+
+### Restaurar modo normal
+
+```bash
+./scripts/modo_resonancia_pad6.sh off
+```
+
+### Consultar estado actual
+
+```bash
+./scripts/modo_resonancia_pad6.sh status
+```
+
+## Solución de problemas rápida
+
+- Si dice `adb no está instalado`: instala Platform Tools y vuelve a abrir la terminal.
+- Si sale `unauthorized`: desbloquea la tablet y acepta la huella RSA.
+- Si no aparece en `adb devices`: prueba otro cable USB o cambia el modo USB a transferencia de archivos.
+
+## Complemento recomendado (manual)
+
+En la tablet instala MacroDroid y crea 2 macros:
+
+1. **Resonancia ON**
+   - Activar No molestar
+   - Brillo 25–30%
+   - Abrir app de respiración
+   - Abrir música relajante
+   - Temporizador 20 minutos
+
+2. **Resonancia OFF**
+   - Desactivar No molestar
+   - Volver a brillo automático
+   - Cerrar o pausar música
