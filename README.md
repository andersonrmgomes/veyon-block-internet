# Controle de Internet - Laboratório

Este projeto contém scripts para controlar a navegação externa em um laboratório de informática, permitindo **bloquear ou liberar a Internet** em estações de forma centralizada usando o Veyon ou manualmente.

---

## Estrutura do projeto
<pre>
veyon-block-internet/
│
├── scripts/
│ └── ControleInternet.bat # Script principal de bloqueio/liberação
├── deployment/
│ ├── 1_create_bat.bat # Cria pasta e copia script
│ └── 2_create_tasks.bat # Cria tarefas agendadas (executar como administrador)
└── README.md
</pre>


---

## Procedimento de implantação

1. **Copiar a pasta `ControleInternet-Lab` para a estação ou rede compartilhada.**  
2. **Executar `1_create_bat.bat`**  
   - Cria a pasta `C:\Scripts` (se não existir)  
   - Copia `ControleInternet.bat` para `C:\Scripts`  
   - Este script pode ser executado pelo usuário sem privilégios de administrador.  

3. **Executar `2_create_tasks.bat` como Administrador**  
   - Cria as tarefas agendadas:  
     - `BloquearInternet` → executa `ControleInternet.bat bloquear`  
     - `LiberarInternet` → executa `ControleInternet.bat liberar`  
   - Estas tarefas podem ser disparadas manualmente ou pelo **Veyon Start Application**:  
     ```bat
     schtasks /Run /TN "BloquearInternet"
     schtasks /Run /TN "LiberarInternet"
     ```

---

## Como usar o ControleInternet.bat manualmente

```bat
C:\Scripts\ControleInternet.bat bloquear   # Bloqueia a Internet externa
C:\Scripts\ControleInternet.bat liberar   # Libera a Internet externa
```
- Mantém a navegação interna (LAN) e localhost liberada.
- Funciona mesmo para usuários que não são administradores.

---
## Uso via Veyon

Para automatizar o controle em todas as estações do laboratório via Veyon:

- Abra o **Veyon Master**.
- Selecione as estações desejadas ou todas do laboratório.
- Vá em **Start Application**.
- Configure o comando para disparar a tarefa agendada, por exemplo:

  - Para bloquear Internet:
  ```bat
  schtasks /Run /TN "BloquearInternet"

- Para liberar Internet:
  ```bat
    schtasks /Run /TN "LiberarInternet"
- Execute e todas as máquinas selecionadas irão rodar o script em segundo plano, sem intervenção do usuário e sem necessidade de permissões administrativas na estação.

    🔹 Dica: você pode criar atalhos ou botões no Veyon para “Bloquear Internet” e “Liberar Internet” para simplificar o uso diário.
---
## Observações

- Sempre execute 2_create_tasks.bat como Administrador para criar corretamente as tarefas.

- A pasta C:\Scripts é onde os scripts de controle residirão.

- A execução via Veyon permite gerenciar todas as estações simultaneamente, mantendo controle de rede centralizado.

---

## MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
