import unittest
from src.GpuCache import Cache
class TestCache(unittest.TestCase):
    def tearDown(self):
        cache=Cache(6)
        addresses=[1,2,3,4,1,5,6,1]
        results = ["Pass","Pass","Pass","Pass","Collide","Pass","Pass","Collide"]
        for addres, result in zip(addresses,results):
            self.assertEqual(cache.access(addres),result)
if __name__== "__main__":
    unittest.main()