### Comandos:
## Ansible Playbook
( [ ] -> opcional )
```bash
ansible-playbook -i <FICHEIRO DE HOSTS>
                 -u <USERNAME>
                 [--ask-vault-pass <PASSWORD> |
                 --vaul-password-file <FICHEIRO>]
                 <NOME DO PLAYBOOK> 
```
**Nota:** Ao usar o vagrant o username vai ser "vagrant"
## Ansible Vault
### Encriptar/Desencriptar
```bash
ansible-vault encrypt <FICHEIRO>
```
```bash
ansible-vault decrypt <FICHEIRO>
```
### Criar/editar
```bash
ansible-vault create <FICHEIRO>
```
```bash
ansible-vault edit <FICHEIRO>
```
