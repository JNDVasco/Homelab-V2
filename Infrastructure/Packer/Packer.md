# Packer

Packer Templates for creating a 





These templates are created with Packer, with the exception of the LXC one, and can then be used with terraform to provision the infrastucture.

| Template Name    | Type | OS            | Description                                 |
| ---------------- | ---- | ------------- | ------------------------------------------- |
| Rocky9-Clean     | VM   | Rocky Linux 9 | Has cockpit installed                       |
| Rocky9-Docker    | VM   | Rocky Linux 9 | Clean + docker and docker compose installed |
| LXC-Rocky9-Clean | LXC  | Rocky Linux 9 | Has SSH server, ncurses and nano            |
