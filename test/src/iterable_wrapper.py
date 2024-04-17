import itertools
from collections import Iterable

from mldev.yaml_loader import _bind_eval_ctx
from yaml import SequenceNode, MappingNode
from yaml.constructor import ConstructorError

from mldev.experiment_tag import experiment_tag
from mldev.experiment_objects import BasicStage

from mldev import logger


class InnerIterator:

    def __init__(self, loader, items, iterable_root):
        self.__items = iter(items)
        self.__loader = loader
        self.__iterable_root = iterable_root

    def __iter__(self):
        return self

    def __next__(self):
        next_item = next(self.__items)
        constructed = self.__loader.construct_object(next_item, deep=True)
        ctx = constructed
        _bind_eval_ctx(constructed, ctx=ctx, doc=self.__iterable_root)
        return constructed


def iterable_wrapper_loader(cls):

    def wrapped(loader, node):
        logger.info('IterableWrapper loader executed')
        if (not isinstance(node, SequenceNode)) and (not isinstance(node, MappingNode)):
            raise ConstructorError(None, None,
                                   "expected a sequence or mapping node, but found %s" % node.id,
                                   node.start_mark)

        if isinstance(node, SequenceNode):
            iterable = InnerIterator(loader, node.value, node)
            return cls(iterable)
        if isinstance(node, MappingNode):
            iterable = InnerIterator(loader, [val[0] for val in node.value], node)
            return cls(iterable)

    return wrapped


@experiment_tag(loader=iterable_wrapper_loader)
class IterableWrapper:

    def __init__(self, arg: Iterable):
        self.args = list(itertools.tee(arg, 3))[1:]
        self.arg = None
        self.iter_num = 0

    def __iter__(self):
        if self.iter_num >= 2:
            raise RuntimeError('Not supposed to iterate over more that 2 times')
        logger.info('IterableWrapper __iter__ is called')
        self.arg = self.args[self.iter_num]
        self.iter_num += 1
        return self

    def __next__(self):
        try:
            logger.info('IterableWrapper __next__ is called')
            return next(self.arg)
        except StopIteration:
            logger.info('IterableWrapper StopIteration is called')
            raise StopIteration


@experiment_tag()
class LazyConstructionTestStage(BasicStage):

    def __init__(self, name="", params={}):
        super().__init__(name=name, params=params, script='echo test')
        self.name = name
        logger.info(f'LazyConstructionTestStage {name} constructor called')

    def __call__(self, name, *args, experiment={}, mode="run", **kwargs):
        logger.info(f'LazyConstructionTestStage {self.name} __call__ called with mode {mode}')
        super().__call__(self, name, *args, experiment={}, mode=mode, **kwargs)

    def prepare(self, stage_name):
        logger.info(f'LazyConstructionTestStage {self.name} prepare called')

    def run(self, stage_name):
        logger.info(f'LazyConstructionTestStage {self.name} run called')
        if self.params:
            if 'evaluated' in self.params:
                logger.info(f'LazyConstructionTestStage {self.name} evaluated = '
                            f'{self.params["evaluated"]}')
