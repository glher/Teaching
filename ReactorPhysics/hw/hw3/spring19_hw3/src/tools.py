
class MiscFunctions:

    @staticmethod
    def cleanup(res):
        """
        This function cleans up the results from the regex matching (by removing empty line or commented lines)
        :param res: Regex result
        :return: results: Cleaned up result
        """
        # Initialize results
        results = []
        # For each line in the match found
        for r in res:
            # If the line is empty or if it starts with a '#', go to the next line
            if not r or r.startswith('#'):
                continue
            # Add only the real data lines
            results.append(r)
        return results