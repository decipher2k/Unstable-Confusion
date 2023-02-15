from godot import exposed, export
from godot import *
import torch
import sys
import os
from diffusers import StableDiffusionPipeline, DPMSolverMultistepScheduler, StableDiffusionImg2ImgPipeline, EulerDiscreteScheduler
from threading import Thread

from PIL import Image

from io import BytesIO
#import io
#from skimage import io

@exposed
class SD(Node):

	# member variables here, example:
	a = export(int)
	b = export(str, default='foo')
	running=export(bool,default=False)
	finished=export(bool,default=False)
	modelloading=export(bool,default=False)
	image=export(str,default='')
	

	def generate(self):
		if self.image=='':
			model_id = "stable-diffusion-2-1"
			self.modelloading=True			
			pipe = StableDiffusionPipeline.from_pretrained(model_id, torch_dtype=torch.float16)
			pipe.scheduler = DPMSolverMultistepScheduler.from_config(pipe.scheduler.config)
			pipe = pipe.to("cuda")
			pipe.enable_attention_slicing() 
			self.modelloading=False
			image = pipe(str(self.b)).images[0]
			tmp=os.getenv('TEMP')
			image.save(tmp+"\\squirrel-0.png")	
			del(image)
			del(pipe.scheduler)
			del(pipe)		
			torch.cuda.empty_cache()	
			self.b=""
			self.finished=True
		else:
			model_id = "stable-diffusion-2-1"
			self.modelloading=True			
			pipe = StableDiffusionImg2ImgPipeline.from_pretrained(model_id, torch_dtype=torch.float16)
			pipe.scheduler = DPMSolverMultistepScheduler.from_config(pipe.scheduler.config)
			pipe = pipe.to("cuda")
			pipe.enable_attention_slicing() 
			self.modelloading=False
			#image = pipe(str(self.b)).images[0]
			#from skimage import io
			#init_images = io.imread(str(self.image)).resize((768,768))
			init_images = Image.open(str(self.image)).convert("RGB").resize((768,768))
			image = pipe(str(self.b), image=init_images).images[0]
			tmp=os.getenv('TEMP')
			image.save(tmp+"\\squirrel-0.png")	
			del(image)
			del(pipe.scheduler)
			del(pipe)		
			torch.cuda.empty_cache()	
			self.b=""
			self.finished=True

	def _ready(self):
		
		"""
		Called every time the node is added to the scene.
		Initialization here.
		"""
		pass
		
	def _process(self, delta):
		if(self.running==True):
			self.modelloading=False
			self.finished=False
			self.running=False
			thread = Thread(target=self.generate)
#			self.generate()
			thread.start()
