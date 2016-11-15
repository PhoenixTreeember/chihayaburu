# softmax用設定ファイル
# 各自の環境に置き換えてください
train_csv = '/media/natu/data/data/src/output/train.csv'
test_csv = '/media/natu/data/data/src/output/test.csv'

# 学習に関する設定
batch_size = 100
max_step = 1000

# 学習結果の保存関係
# 保存に使うファイル名
save_model_name = "model.ckpt"

# Trueにすると学習結果を保存
# Trueにすると学習結果を読み込む
#load_enable = False

# Trueにすると学習をスキップ
#skip_study = False
#-----------------------------------------------------------------------
# 以下の組み合わせで設定する。
#
# ①初めて学習させるとき。何か設定を変えて再度学習をするとき
# save_enable = True
# load_enable = Fales
# skip_study = False
#
# ②前回の学習結果を読み込んで、さらに学習させるとき
# save_enable = True
# load_enable = True
# skip_study = False
#
# ③学習結果を読み込み、学習をスキップうするとき
# save_enable = False
# load_enable = True
# skip_study = True

save_enable = True
load_enable = False
skip_study = False

