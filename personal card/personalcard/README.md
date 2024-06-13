# personalcard

A Flutter application that includes some information about me.

## Prerequisites

nsure you have the following installed:

Flutter SDK: Flutter Installation Guide
A compatible IDE (e.g., Android Studio, Visual Studio Code)

## Install Dependencies:

Run the following command to fetch the necessary dependencies: 
```sh
flutter pub get
```

## GitHub Link Configuration 

To enable the GitHub link functionality, update the queries section in the `AndroidManifest.xml` file.

1. Open the `AndroidManifest.xml` file located at:
 `personalcard\.android\app\src\main\AndroidManifest.xml`


2. Replace the exixting `queries` section with the following:

```sh
    <queries>
        <intent>
            <action android:name="android.intent.action.PROCESS_TEXT"/>
            <data android:mimeType="text/plain"/>
        </intent>
         <intent>
            <action android:name="android.intent.action.VIEW" />
            <category android:name="android.intent.category.BROWSABLE" />
            <data android:scheme="https" />
        </intent>
    </queries>
```
This change ensures that the application can open URLs using a web browser.
