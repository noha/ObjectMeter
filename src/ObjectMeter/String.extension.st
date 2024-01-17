Extension { #name : #String }

{ #category : #'*ObjectMeter' }
String >> recursiveSizeIn: aSizeMeasure [
	^ self sizeInMemory 
]
