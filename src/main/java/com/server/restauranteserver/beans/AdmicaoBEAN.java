/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.server.restauranteserver.beans;

import java.util.Date;

/**
 *
 * @author Daniel
 */
public class AdmicaoBEAN {

    private int funcionario;
    private int empresa;
    private Date admicao;
    private Date saida;
    private int uniforme;
    private int cartaoPonto;
    private Float salario;

    public int getFuncionario() {
        return funcionario;
    }

    public void setFuncionario(int funcionario) {
        this.funcionario = funcionario;
    }

    public int getEmpresa() {
        return empresa;
    }

    public void setEmpresa(int empresa) {
        this.empresa = empresa;
    }

    public Date getAdmicao() {
        return admicao;
    }

    public void setAdmicao(Date admicao) {
        this.admicao = admicao;
    }

    public Date getSaida() {
        return saida;
    }

    public void setSaida(Date saida) {
        this.saida = saida;
    }

    public int getUniforme() {
        return uniforme;
    }

    public void setUniforme(int uniforme) {
        this.uniforme = uniforme;
    }

    public int getCartaoPonto() {
        return cartaoPonto;
    }

    public void setCartaoPonto(int cartaoPonto) {
        this.cartaoPonto = cartaoPonto;
    }

    public Float getSalario() {
        return salario;
    }

    public void setSalario(Float salario) {
        this.salario = salario;
    }
    

}
