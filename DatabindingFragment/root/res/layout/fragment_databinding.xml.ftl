<?xml version="1.0" encoding="utf-8"?>
<layout>
    <data>
    </data>
	<${getMaterialComponentName('android.support.constraint.ConstraintLayout', useAndroidX)}
		xmlns:android="http://schemas.android.com/apk/res/android"
        xmlns:tools="http://schemas.android.com/tools"
        xmlns:app="http://schemas.android.com/apk/res-auto"
		android:layout_width="match_parent"
		android:layout_height="match_parent"
		tools:context="${packageName}.${className}">

		<TextView
			android:layout_width="match_parent"
			android:layout_height="match_parent"
			android:text="@string/hello_blank_fragment" />

	</${getMaterialComponentName('android.support.constraint.ConstraintLayout', useAndroidX)}>
</layout>
