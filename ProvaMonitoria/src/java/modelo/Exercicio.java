/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
//import javax.persistence.NamedNativeQueries;
//import javax.persistence.NamedNativeQuery;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author icaro
 */
@Entity
@Table(name = "exercicio")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Exercicio.findAll", query = "SELECT e FROM Exercicio e"),
    @NamedQuery(name = "Exercicio.findById", query = "SELECT e FROM Exercicio e WHERE e.id = :id"),
    @NamedQuery(name = "Exercicio.findByTitulo", query = "SELECT e FROM Exercicio e WHERE e.titulo = :titulo"),
    @NamedQuery(name = "Exercicio.findByDescricao", query = "SELECT e FROM Exercicio e WHERE e.descricao = :descricao"),
    @NamedQuery(name = "Exercicio.findByAlternativaA", query = "SELECT e FROM Exercicio e WHERE e.alternativaA = :alternativaA"),
    @NamedQuery(name = "Exercicio.findByAlternativaB", query = "SELECT e FROM Exercicio e WHERE e.alternativaB = :alternativaB"),
    @NamedQuery(name = "Exercicio.findByAlternativaC", query = "SELECT e FROM Exercicio e WHERE e.alternativaC = :alternativaC"),
    @NamedQuery(name = "Exercicio.findByAlternativaD", query = "SELECT e FROM Exercicio e WHERE e.alternativaD = :alternativaD"),
    @NamedQuery(name = "Exercicio.findFilter", query = "SELECT e FROM Exercicio e WHERE e.titulo like :filtro or"
                                                                                                    + " CAST(e.id VARCHAR(50)) like :filtro or"
                                                                                                    + " e.descricao like :filtro or"
                                                                                                    + " e.idProfessor.nome like :filtro")})
//@NamedNativeQueries({
//    @NamedNativeQuery(name = "Exercicio.alternativa", query = "SELECT * FROM Exercicio WHERE alternativaA = true or "
//                                                                                        + "alternativaB = true or"
//                                                                                        + "alternativaC = true or"
//                                                                                        + "alternativaD = true",
//    resultClass = Exercicio.class)})
public class Exercicio implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "titulo")
    private String titulo;
    @Basic(optional = false)
    @Column(name = "descricao")
    private String descricao;
    @Column(name = "alternativa_a")
    private Boolean alternativaA;
    @Column(name = "alternativa_b")
    private Boolean alternativaB;
    @Column(name = "alternativa_c")
    private Boolean alternativaC;
    @Column(name = "alternativa_d")
    private Boolean alternativaD;
    @JoinColumn(name = "id_professor", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Professor idProfessor;

    public Exercicio() {
    }

    public Exercicio(Integer id) {
        this.id = id;
    }

    public Exercicio(Integer id, String titulo, String descricao) {
        this.id = id;
        this.titulo = titulo;
        this.descricao = descricao;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Boolean getAlternativaA() {
        return alternativaA;
    }

    public void setAlternativaA(Boolean alternativaA) {
        this.alternativaA = alternativaA;
    }

    public Boolean getAlternativaB() {
        return alternativaB;
    }

    public void setAlternativaB(Boolean alternativaB) {
        this.alternativaB = alternativaB;
    }

    public Boolean getAlternativaC() {
        return alternativaC;
    }

    public void setAlternativaC(Boolean alternativaC) {
        this.alternativaC = alternativaC;
    }

    public Boolean getAlternativaD() {
        return alternativaD;
    }

    public void setAlternativaD(Boolean alternativaD) {
        this.alternativaD = alternativaD;
    }

    public Professor getIdProfessor() {
        return idProfessor;
    }

    public void setIdProfessor(Professor idProfessor) {
        this.idProfessor = idProfessor;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Exercicio)) {
            return false;
        }
        Exercicio other = (Exercicio) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Exercicio[ id=" + id + " ]";
    }
    
}
