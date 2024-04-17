# Licensed under the Apache License: http://www.apache.org/licenses/LICENSE-2.0
# For details: https://gitlab.com/mlrep/mldev/-/blob/master/NOTICE.md

import logging
import os
import sys

d = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.append(d.rstrip("/") + "/src")
sys.path.append(d.rstrip("/") + "/test/src")
from mldev_config_parser.config_parser import MLDevSettings

app_settings = MLDevSettings(config_path=f"./test/config.yaml", raise_deps=False)
logger = logging.getLogger("mldev_test")
logger.setLevel(app_settings.get_value("LOG_LEVEL"))
sh = logging.StreamHandler()
sh.setFormatter(logging.Formatter(logging.BASIC_FORMAT))
logger.addHandler(sh)

if app_settings.logs_dir is not None:
    test_logs_path = app_settings.logs_dir.rstrip("/") + "/" + "test/"
    if not os.path.exists(test_logs_path):
        os.mkdir(test_logs_path)
    fh = logging.FileHandler(test_logs_path + "debug.log")
    fh.setLevel(logging.DEBUG)
    logger.addHandler(fh)
