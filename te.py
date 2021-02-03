import urllib.request
import argparse

parser = argparse.ArgumentParser(description='fake_audio params')
parser.add_argument('--input-path', type=str, help='Path of the input file.')
parser.add_argument('--volume-path', type=str, help='Path of the input file.')
args = parser.parse_args()

f=open(args.volume_path+"/output", "w")
f.write("no")
f.close()

f=open(args.volume_path+"/output_path", "w")
f.write("path")
f.close()

