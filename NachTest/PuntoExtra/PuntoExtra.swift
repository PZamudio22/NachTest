//
//  PuntoExtra.swift
//  NachTest
//
//  Created by Kevin Uriel Velazquez Zamudio on 09/01/22.
//

import Foundation

/*
CICLO DE VIDA DE UNA APP

El ciclo de vida es el estado en el que se encuentra nuestra aplicacion desde que la abrimos hasta que la cerramos, por lo general casi todo el ciclo de vida de una App se encuentraa en el AppDelegate y contiene el FOREGROUND y BACKGROUND

El ForeGround es la aplicacion que estamos usando en el momento: En este se encuentra el didFinishLaunchingWithOptions es cuando la aplicacion ya cargo
Luego esta el ApplicationWillResign que es donde pasa de ForeGround a BackGround
En el DidEnterBackGround es donde ya entro el BackGround y ya podemos ejecutar ciertas acciones o tareas
El BackGround es cuando la pasamos a segundo plano
Despues entra el WillEnterForeGround que es como el ApplicationWillResign solo que a la inversa aqui va a entrar el ForeGround o sea que nos estamos regresando del BackGround
Luego esta el DidBecomeActive es cuando la App ya esta activa de nuevo y ya esta el ForeGround activo
Por ultimo esta el ApplicationWillTerminate que es cuando cerramos la App y tambien permite guardar lo ultimo que hicimos en la app



CICLO DE VIDA DE UN VIEWCONTROLLER

Cada ViewController tiene su propio ciclo de vida estas son las partes en las que se forma

El primero es el LoadView, este se ejecuta antes de la aplicacion cargue por completo
El segundo es el ViewDidLoad, este viene por defecto cuando creamos un ViewController y entra cunado la vista ya cargo en memoria RAM y este solo se ejecuta una vez a menos que desaparezcamos la vista por completo
Despues esta el ViewWIllApper este se activa antes de que la vista sea visible
Luego esta el ViewDidApper, este se activa cunado la vista ya es visible
Luego esta el ViewWillDisapper, se activa cunado la vista va a desaparecer
Por ultimo esta el ViewDidDisappear, y este se activa cuando la vista ya desapareció
Este que se llama DidReceiveMemoryWarning, no es muy comun de utilizar porque esta se activa cuando hay problemas de memoria RAM lo podemos actvar también para que la App no se vaya a cerrar de forma inesperada
 
 3.- El ARC es el que permite liberar la memoria de aquellos elementos que no posean referencias fuertes hacia ellos y su acronimo significa Automatic Reference Counting
 
 4.- Un strong se utiliza en caso de que en una incializacion las varibales que contenga sean opcionales y vengan nulas (nil) para asi instanciarlas a una misma y aunque vengan nulas sigan existiendo
 
    .Un Weak se puede usar en caso de que en una inicializacion que tenga muchas refenrecias fuertes y cause un problea de memoria el ARC puede elminar las WeakVar y siempre se utiliza con opcionales
 
    .Las Unowned son practicamente iguales a las Weak solo que estas siempre tienen un valor
 
 5.- El color de la pantalla es rojo por que en la funcion DidFinish se esta instanciando un color amarillo pero como en la Vista en el ViewDidLoad la cambia a rojo esa es la que se mostrara porque es cuando la vista ya cargo. 
 
 */
