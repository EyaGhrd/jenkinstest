package com.example;

public class Main {
    public static void main(String[] args) {
        System.out.println("Hello for Jenkins!");
        while (true) {
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}
