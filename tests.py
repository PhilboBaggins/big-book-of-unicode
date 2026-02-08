#!/usr/bin/env python3

import json
import unittest
import functools


#
# Helper functions
#


def getData():
    return json.loads(open("data.json").read())


#
# Test class
#


class DataTests(unittest.TestCase):

    def test_key_mappings(self):
        """Check every key that is used in the character specification list and make sure that each has an entry in the key mappings list except for a few that don't need one)"""

        # Keys that don't need a mapping
        whiteListKeys = ["unicode_number", "symbol"]

        data = getData()
        keysWithMappings = list(data["key_mappings"].keys())
        keysInCharSpecs = functools.reduce(
            lambda a, b: a.union(b.keys()), data["characters"], set()
        )
        keysWithOutMapping = [
            k for k in keysInCharSpecs if k not in (keysWithMappings + whiteListKeys)
        ]
        # keysWithOutMapping = filter(lambda k: k not in (keysWithMappings + whiteListKeys), keysInCharSpecs)

        self.assertEqual(
            len(keysWithOutMapping),
            0,
            "The following keys are used to describe characters but do not text mapping: %s"
            % keysWithOutMapping,
        )

    # TODO: More tests!!!


if __name__ == "__main__":
    # Alternatively you could run it like this:
    # $ python -m unittest tests.py

    suite = unittest.TestLoader().loadTestsFromTestCase(DataTests)
    unittest.TextTestRunner(verbosity=2).run(suite)
