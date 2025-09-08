# Para aprender más sobre cómo usar Nix para configurar tu entorno
# mira: https://firebase.google.com/docs/studio/customize-workspace
{ pkgs, ... }: {
  # Qué canal de nixpkgs usar.
  channel = "stable-24.05"; # o "unstable"

  # Usa https://search.nixos.org/packages para encontrar paquetes
  packages = [
    # Paquetes agregados para Docker
    pkgs.docker
    pkgs.docker-compose
  ];

  # Habilita el servicio de Docker.
  services.docker.enable = true;

  # Establece variables de entorno en el espacio de trabajo
  env = {};

  idx = {
    # Busca las extensiones que quieras en https://open-vsx.org/ y usa "publisher.id"
    extensions = [
      # Extensión para trabajar con Docker en VS Code
      "ms-azuretools.vscode-docker"
    ];

    # Habilitar vistas previas
    previews = {
      enable = true;
      previews = {
        # web = {
        #   # Ejemplo: ejecuta "npm run dev" con PORT configurado en el puerto de vista previa de IDX,
        #   # y muéstralo en el panel de vista previa web de IDX
        #   command = ["npm" "run" "dev"];
        #   manager = "web";
        #   env = {
        #     # Variables de entorno para tu servidor
        #     PORT = "$PORT";
        #   };
        # };
      };
    };

    # Hooks del ciclo de vida del espacio de trabajo
    workspace = {
      # Se ejecuta cuando un espacio de trabajo es creado por primera vez
      onCreate = {
        # Ejemplo: instala dependencias de JS de NPM
        # npm-install = "npm install";
      };
      # Se ejecuta cuando el espacio de trabajo se (re)inicia
      onStart = {
        # Se asegura de que el servicio de Docker esté corriendo al iniciar.
        docker-start = "systemctl start docker";
        # Ejemplo: inicia un contenedor de Docker en segundo plano
        # docker-compose = "docker-compose up -d";
      };
    };
  };
}