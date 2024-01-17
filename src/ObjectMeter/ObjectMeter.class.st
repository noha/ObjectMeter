Class {
	#name : #ObjectMeter,
	#superclass : #Object,
	#instVars : [
		'root',
		'seen'
	],
	#category : #ObjectMeter
}

{ #category : #'instance creation' }
ObjectMeter class >> on: anObject [
	^ self new 
		root: anObject 
]

{ #category : #initialization }
ObjectMeter >> initialize [ 
	super initialize.
	seen := IdentitySet new
]

{ #category : #'as yet unclassified' }
ObjectMeter >> recursiveSizeOf: anObject [ 
	| references size |
	(seen includes: anObject) ifTrue: [ ^ 0 ].
	seen add: anObject.
	size := 0.
	references := anObject class isVariable 
		ifTrue: [ (anObject collect: [ :each | each recursiveSizeIn: self ]) ]
		ifFalse: [ 
			(anObject class instVarNames collect: [ :each |
				(anObject instVarNamed: each) recursiveSizeIn: self ]) ].
	^ (references 
		ifNotEmpty: [ references sum ]
		ifEmpty: [ 0 ]) + anObject sizeInMemory 
]

{ #category : #accessing }
ObjectMeter >> root: anObject [
	root := anObject 
]
