import os
from pathlib import Path
from dotenv import load_dotenv

BASE_DIR = Path(__file__).resolve().parent
ENV_FILE = BASE_DIR / ".env"

load_dotenv(ENV_FILE)

VALID_USER = os.getenv("VALID_USER")
VALID_PASS = os.getenv("VALID_PASS")
LOCKED_USER = os.getenv("LOCKED_USER")
LOCKED_PASS = os.getenv("LOCKED_PASS")