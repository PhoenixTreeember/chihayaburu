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

#wc1proc('wc1.npy', 'wc1.txt')
#wc2proc('wc2.npy', 'wc2.txt')

