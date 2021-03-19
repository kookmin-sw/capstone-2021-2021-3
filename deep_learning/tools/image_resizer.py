"""이미지 디렉토리, 출력 디렉토리, resize 하고싶은 이미지 사이즈 주어지면 이미지들 resize해서 저장.

사용 예제:
python tools/image_resizer.py --image_dir="path/to/image/dir" \
  --out_dir="path/to/resized/out/dir" --image_size=224
"""
import os
import itertools
from pathlib import Path

from PIL import Image
from absl import app
from absl import flags


def glob_jpeg_alike(dir_path):
  return itertools.chain((dir_path.glob("*.jpeg")), dir_path.glob("*.jpg"),
                         dir_path.glob("*.JPG"))


def main(_):
  image_dir = Path(flags.FLAGS.image_dir)
  if not image_dir.is_dir():
    print(f"No such directory {image_dir}")
    exit(1)

  out_dir = Path(flags.FLAGS.out_dir)
  out_dir.mkdir(parents=True, exist_ok=True)

  # jpg, jpeg 이미지들만 가져옴. png등 다른포멧 고려하지 않음.
  paths = glob_jpeg_alike(image_dir)
  new_size = (flags.FLAGS.image_size, flags.FLAGS.image_size)

  for path in paths:
    with Image.open(path) as img:
      resized_img = img.resize(new_size)
      resized_img.save(out_dir / path.name)


if __name__ == "__main__":
  flags.DEFINE_string("image_dir", None, "이미지 폴더 경로")
  flags.DEFINE_string("out_dir", "resized_out", "resize된 이미지들 저장할 디렉토리 경로")
  flags.DEFINE_integer("image_size", None, "원하는 resize된 이미지 사이즈")
  app.run(main)