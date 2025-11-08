<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Monitor del Sistema - Grupo 9</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; background: #f5f5f5; }
        .container { max-width: 800px; margin: 0 auto; background: white; padding: 20px; border-radius: 10px; }
        .reporte { background: #f0f0f0; padding: 15px; margin: 10px 0; border-radius: 5px; font-family: monospace; }
        button { background: #007cba; color: white; padding: 10px; border: none; border-radius: 5px; cursor: pointer; }
    </style>
</head>
<body>
    <div class="container">
        <h1>📊 Monitor del Sistema - Grupo 9</h1>
        <button onclick="location.reload()">🔄 Actualizar</button>
        <div class="reporte">
<?php
$output = shell_exec('/var/www/scripts/reporte_sistema.sh');
echo htmlspecialchars($output);
?>
        </div>
        <p><em>Actualizado: <?php echo date('Y-m-d H:i:s'); ?></em></p>
    </div>
</body>
</html>
