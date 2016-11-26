import struct
from PIL import Image

sz_record = 0

def read_record_ETL8G(f):
  s = f.read(8199)
  r = struct.unpack('>2H8sI4B4H2B30x8128s11x', s)
  iF = Image.frombytes('F', (128, 127), r[14], 'bit', 4)
  iL = iF.convert('L')
  return r + (iL,)


filename = '/media/natu/data/data/sansou/ETL8G/ETL8G_01'
id_record = 0

with open(filename, 'rb') as f:
  f.seek(id_record * sz_record)
  r = read_record_ETL8G(f)

print(r[0:-2])
print(hex(r[1]))
iE = Image.eval(r[-1], lambda x: 255 - x * 16)
fn = 'ETL8G_{:d}_{:s}.png'.format((r[0] - 1) % 20 + 1, hex(r[1])[-4:])
iE.save(fn, 'PNG')
