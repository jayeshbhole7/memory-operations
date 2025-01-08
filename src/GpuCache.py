class Cache:
    def __init__(self, size):
        self.size = size
        self.cache = []

    def access(self,address):
        if address in self.cache:
            self.cache.remove(address)
            self.cache.append(address)
            return "Collide"
        
        else:
            if len(self.cache)>= self.size:
                self.cache.pop(0)
            self.cache.append(address)
            return "Pass"
        
if __name__ == "__main__":
    cache = Cache(4)
    addresses = [1,2,3,4,1,5,6,1]

    for addres in addresses:
        print(f"accessing {addres}:{cache.access(addres)}")