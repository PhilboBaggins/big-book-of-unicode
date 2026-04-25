#!/usr/bin/env python3
"""
Project test suite
"""

import json
import unittest
import subprocess


DATA_FILE = "data.json"


def get_data():
    """Helper function to load the data.json file"""
    return json.loads(open(DATA_FILE, "r", encoding="utf-8").read())


class DataTests(unittest.TestCase):
    """Tests for the data.json file"""

    def test_data_unicode_number_in_order(self):
        """Check that the unicode numbers in the data are in order"""
        data = get_data()
        unicode_numbers = [char["unicode_number"] for char in data["characters"]]
        self.assertEqual(unicode_numbers, sorted(unicode_numbers))

    def test_data_unicode_number_no_missing(self):
        """Check that there are no missing unicode numbers in the data"""
        data = get_data()
        unicode_numbers = [char["unicode_number"] for char in data["characters"]]
        for idx, number in enumerate(unicode_numbers):
            if idx == 0:
                continue  # Skip the first one since we can't check it against a previous number
            expected_number = unicode_numbers[idx - 1] + 1
            self.assertEqual(
                number, expected_number, f"{expected_number} missing from {DATA_FILE}"
            )


if __name__ == "__main__":
    # Run test suite above
    print("Running data tests...")
    suite = unittest.TestLoader().loadTestsFromTestCase(DataTests)
    unittest.TextTestRunner(verbosity=2).run(suite)

    # Run pre-commit hooks on all files in the project
    print("\n\nRunning pre-commit hooks on all files...")
    subprocess.check_call(["pre-commit", "run", "--all-files"])
