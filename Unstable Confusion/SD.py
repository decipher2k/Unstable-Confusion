from godot import exposed, export
from godot import *
import torch
import sys
import os
from diffusers import StableDiffusionPipeline, DPMSolverMultistepScheduler
from threading import Thread

@exposed
class SD(Node):

	# member variables here, example:
	a = export(int)
	b = export(str, default='foo')
	running=export(bool,default=False)
	finished=export(bool,default=False)
	
	def generate(self):
		model_id = "stable-diffusion-2-1"

		pipe = StableDiffusionPipeline.from_pretrained(model_id, torch_dtype=torch.float16)
		pipe.scheduler = DPMSolverMultistepScheduler.from_config(pipe.scheduler.config)
		pipe = pipe.to("cuda")
		pipe.enable_attention_slicing() 

		
		image = pipe(str(self.b)).images[0]
		tmp=os.getenv('TEMP')
		image.save(tmp+"\\squirrel-0.png")	
		self.b=""
		self.finished=True

	def _ready(self):
		self.running=False
		"""
		Called every time the node is added to the scene.
		Initialization here.
		"""
		pass
		
	def _process(self, delta):
		if(self.running==True):
			self.finished=False
			self.running=False
			thread = Thread(target=self.generate)
#			self.generate()
			thread.start()
