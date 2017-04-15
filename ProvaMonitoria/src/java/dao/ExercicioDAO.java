/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import modelo.Exercicio;

/**
 *
 * @author icaro
 */
public class ExercicioDAO extends GenericDAO<Exercicio, Integer> {

    public ExercicioDAO() {
        super(Exercicio.class);
    }   
}