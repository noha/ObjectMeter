Extension { #name : #Object }

{ #category : #'*ObjectMeter' }
Object >> recursiveSizeIn: aSizeMeasure [ 
	^ aSizeMeasure recursiveSizeOf: self
]

{ #category : #'*ObjectMeter' }
Object >> recursiveSizeInMemory [
	^ self recursiveSizeIn: (ObjectMeter on: self)
]
