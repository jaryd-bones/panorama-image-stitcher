$root = Split-Path -Parent $MyInvocation.MyCommand.Path

# Start backend
Start-Process powershell `
  -ArgumentList "-NoExit", "-Command", ". .\.venv\Scripts\Activate.ps1; python -m uvicorn app.main:app --reload --host 127.0.0.1 --port 8000" `
  -WorkingDirectory "$root\server"

# Start frontend
Start-Process powershell `
  -ArgumentList "-NoExit", "-Command", "npm run dev" `
  -WorkingDirectory "$root\client"

Write-Host "Frontend (5173) and backend (8000) launched."
