import numpy as np

output_dir = 'output'

def wc1proc(input, output):
  """5x5のフィルターが32個"""
  arr = np.load(input)
  with open(output_dir + '/' + output, 'w') as fp:
    fp.write("# %s\n" % str(arr.T.shape))

    for a in arr.T:
      for b in a:
        for c in b:
          for d in c:
            fp.write('%s\n' % str(d))
        fp.write('\n')

def wc2proc(input, output):
    """5x5のフィルターが32個"""
    arr = np.load(input)
    with open(output_dir + '/' + output, 'w') as fp:
      fp.write("# %s\n" % str(arr.T.shape))

      i = 0
      for a in arr.T:
        fp.write("# %d\n" % i)
        for b in a:
          for c in b:
            for d in c:
              fp.write('%s\n' % str(d))
          fp.write('\n')
        i+=1


def bc1proc(input, output):
  arr = np.load(input)
  with open(output_dir + '/' + output, 'w') as fp:
    for a in arr:
      fp.write("%f\n" % a)

def wfc1proc(input, output):
  arr = np.load(input)
  i = 0
  for a in arr.T:
    with open(output_dir + '/' + output + ("%04d" % i) + ".txt", 'w') as fp:
      for b in a:
          fp.write("%f\n" % b)
    i+=1

#wc1proc('wc1.npy', 'wc1.txt')
#wc2proc('wc2.npy', 'wc2.txt')
#bc1proc('bc1.npy', 'bc1.txt')
#bc1proc('bc2.npy', 'bc2.txt')
#bc1proc('bfc1.npy', 'bfc1.txt')
#bc1proc('bfc2.npy', 'bfc2.txt')

#wfc1proc('wfc1.npy', 'wfc1/wfc1_')
wfc1proc('wfc2.npy', 'wfc2/wfc2_')
