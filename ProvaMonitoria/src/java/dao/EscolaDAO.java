/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import modelo.Escola;

/**
 *
 * @author icaro
 */
public class EscolaDAO extends GenericDAO<Escola, Integer> {

    public EscolaDAO() {
        super(Escola.class);
    }  
}