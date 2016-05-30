package com.epss.dao;

import com.epss.model.LectorDiscipline;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.LinkedList;
import java.util.List;

@Repository("lectorDisciplineDao")
public class LectorDisciplineDaoImpl extends AbstractDao<Integer, LectorDiscipline> implements LectorDisciplineDao{


    @Override
    public List<Integer> getLectorsIdsForDiscipline(int disciplineId) {
        Criteria cr = createEntityCriteria().add(Restrictions.eq("disciplineId", disciplineId))
                .addOrder(Order.asc("disciplineId"));
        List<LectorDiscipline> lectorDisciplines= (List<LectorDiscipline>)cr.list();
        List<Integer> lectorIds= new LinkedList<>();
        for(LectorDiscipline l:lectorDisciplines){
            lectorIds.add(l.getLectorId());
        }
        return lectorIds;
    }

    @Override
    public List<Integer> getDisciplinesIdsForLector(int lectorId) {
        Criteria cr = createEntityCriteria().add(Restrictions.eq("lectorId", lectorId))
                .addOrder(Order.asc("lectorId"));
        List<LectorDiscipline> lectorDisciplines= (List<LectorDiscipline>)cr.list();
        List<Integer> disciplinesIds= new LinkedList<>();
        for(LectorDiscipline l:lectorDisciplines){
            disciplinesIds.add(l.getDisciplineId());
        }
        return disciplinesIds;
    }
}
