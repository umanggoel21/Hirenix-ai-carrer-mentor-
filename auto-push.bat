@echo off
echo Auto-pushing changes to GitHub...
git add .
git commit -m "Auto-commit: %date% %time%"
git push origin main
echo Done! 