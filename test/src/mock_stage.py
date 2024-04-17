from mldev.experiment_tag import experiment_tag
from mldev import logger
from mldev.experiment_objects import BasicStage


@experiment_tag()
class MockStage(BasicStage):

    def __init__(self, name=""):
        super().__init__(name=name, script='echo test')
        self.name = name

    def __call__(self, name, *args, experiment={}, **kwargs):
        logger.info(f'MockStage __call__ called')

    def prepare(self, stage_name):
        logger.info(f'MockStage prepare called')

    def run(self, stage_name):
        logger.info(f'MockStage run called')
