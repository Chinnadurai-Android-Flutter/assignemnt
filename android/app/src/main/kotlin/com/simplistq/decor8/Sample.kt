package com.simplistq.decor8

import java.util.*
import kotlin.collections.ArrayList

internal object Sum {
    var shortingValues = ArrayList<Any>();
    @JvmStatic
    fun main(arg: Array<String>) {
        val n: Int
        val sc = Scanner(System.`in`)
        print("Enter how many numbers you want to check: ")
        n = sc.nextInt()
        var tempValues = ArrayList<Any>();
        print("Enter the $n values,\n")
        for (i in 0 until n) {
            print("Enter values " + (i + 1) + ": ")
            tempValues.add(sc.next())
        }
        tempValues.forEachIndexed { index, any ->
            if (!isInteger(tempValues[index].toString())) {
                println("S.No: ${index + 1}, Values: ${tempValues[index]} is not integer");
            } else {
                shortingValues.add(tempValues[index])
            }
        }
        val values: Array<Any> = shortingValues.toTypedArray()
        values.sort()
        println("Given values in ascending order ${values.joinToString()}")
    }
}

fun isInteger(str: String?) = str?.toIntOrNull()?.let { true } ?: false
