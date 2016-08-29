package org.openmrs.module.inventory.model;

import java.io.Serializable;

/**
 * @author Stanslaus Odhiambo
 *         Created on 8/26/2016.
 */
public class ToxoidModel implements Serializable {
    private String vaccineName;
    private String dateGiven, dateRecorded, provider, formulation;

    public String getVaccineName() {
        return vaccineName;
    }

    public void setVaccineName(String vaccineName) {
        this.vaccineName = vaccineName;
    }

    public String getDateGiven() {
        return dateGiven;
    }

    public void setDateGiven(String dateGiven) {
        this.dateGiven = dateGiven;
    }

    public String getDateRecorded() {
        return dateRecorded;
    }

    public void setDateRecorded(String dateRecorded) {
        this.dateRecorded = dateRecorded;
    }

    public String getProvider() {
        return provider;
    }

    public void setProvider(String provider) {
        this.provider = provider;
    }

    public String getFormulation() {
        return formulation;
    }

    public void setFormulation(String formulation) {
        this.formulation = formulation;
    }

    @Override
    public String toString() {
        return "ToxoidModel{" +
                "vaccineName='" + vaccineName + '\'' +
                ", dateGiven='" + dateGiven + '\'' +
                ", dateRecorded='" + dateRecorded + '\'' +
                ", provider='" + provider + '\'' +
                ", formulation='" + formulation + '\'' +
                '}';
    }
}
