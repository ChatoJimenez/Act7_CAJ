/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author jesgu
 */
public class Triangulo {
    private double base;
    private double altura;
    private double perimetro;
    private double area;

    public Triangulo(String base, String altura) {
        this.base = Double.parseDouble(base);
        this.altura = Double.parseDouble(altura);
    }
    
    public void calcularPerimetro() {
        this.perimetro = base*3;
    }

    public double getPerimetro() {
        return this.perimetro;
    }
    
    public void calcularArea(){
        this.area = (base*altura)/2;
    }

    public double getArea() {
        return this.area;
    }

    public double getBase() {
        return base;
    }

    public void setBase(int base) {
        this.base = base;
    }

    public double getAltura() {
        return altura;
    }

    public void setAltura(int altura) {
        this.altura = altura;
    }
}
