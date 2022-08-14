package com.poly.dao;

import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.StoredProcedureQuery;
import javax.persistence.TypedQuery;

import com.poly.util.JpaUtil;

public class AbstractDao<T> {
	public static final EntityManager entityManager = JpaUtil.getEntityManager();
	
	@Override
	protected void finalize() throws Throwable {
		entityManager.close();
		super.finalize();
	}
	
	public T finbyId(Class<T> clazz, Integer id) {
		return entityManager.find(clazz, id);
	}
	
	 public List<T> findAll(Class<T> clazz, boolean exisGetActive){
		 String entityName = clazz.getSimpleName();
		 StringBuilder sql = new StringBuilder();
		 sql.append(" Select o From ").append(entityName).append(" o");
		 if(exisGetActive == true) {
			 sql.append(" where isActive = 1");
		 }
		 TypedQuery<T> query = entityManager.createQuery(sql.toString(), clazz);
		 return query.getResultList();
	 }
	 
	 public List<T> findAll(Class<T> clazz, boolean exisGetActive, int pageNumber, int PageSize){
		 String entityName = clazz.getSimpleName();
		 StringBuilder sql = new StringBuilder();
		 sql.append(" Select o From ").append(entityName).append(" o");
		 if(exisGetActive == true) {
			 sql.append(" where isActive = 1");
		 }
		 TypedQuery<T> query = entityManager.createQuery(sql.toString(), clazz);
		 query.setFirstResult((pageNumber - 1) * PageSize);
		 query.setMaxResults(PageSize);
		 return query.getResultList();
	 }

	 public T findOne(Class<T> clazz, String sql, Object... params) {
		 TypedQuery<T> query = entityManager.createQuery(sql, clazz);
		 for(int i = 0; i < params.length; i++) {
			 query.setParameter(i, params[i]);
		 }
		 List<T> result = query.getResultList();
		 if(result.isEmpty()) {
			 return null;
		 }
		 return result.get(0);
	 }
	 
	 public List<T> findMany(Class<T> clazz, String sql, Object ... params) {
		 TypedQuery<T> query = entityManager.createQuery(sql, clazz);
		 for(int i = 0; i < params.length; i++) {
			 query.setParameter(i, params[i]);
		 }
		 return query.getResultList();
	 }
	 
	 @SuppressWarnings("unchecked")
	 public List<Object[]> findManyByNativeQuery(String sql, Object ... params) {
		 Query query = entityManager.createNativeQuery(sql);
		 
		 for(int i = 0; i < params.length; i++) {
			 query.setParameter(i, params[i]);
		 }
		 return query.getResultList();
	 }
	 
	 public T create(T entity) {
		 try {
			entityManager.getTransaction().begin();
			entityManager.persist(entity);
			entityManager.getTransaction().commit();
			System.out.println("Create Succed!");
			return entity;
		} catch (Exception e) {
			entityManager.getTransaction().rollback();
			System.out.println("Cannot insert entity " + entity.getClass().getSimpleName() + " to DB");
			System.out.println(e.toString()) ;
			return null;
		}
	 }
	 public T update(T entity) {
		 try {
			entityManager.getTransaction().begin();
			entityManager.persist(entity);
			entityManager.getTransaction().commit();
			System.out.println("update Succed!");
			return entity;
		} catch (Exception e) {
			entityManager.getTransaction().rollback();
			System.out.println("Cannot update entity" + entity.getClass().getSimpleName());
			throw new RuntimeException();
		}
	 }
	 public T delete(T entity) {
		 try {
			entityManager.getTransaction().begin();
			entityManager.persist(entity);
			entityManager.getTransaction().commit();
			System.out.println("delete Succed!");
			return entity;
		} catch (Exception e) {
			entityManager.getTransaction().rollback();
			System.out.println("Cannot delete entity" + entity.getClass().getSimpleName());
			throw new RuntimeException();
		}
	 }
	 
	 public List<T> callStored(String namedStored, Map<String, Object> params) {
		 StoredProcedureQuery query = entityManager.createNamedStoredProcedureQuery(namedStored);
		 params.forEach((key, value) -> query.setParameter(key, value));
		 return (List<T>) query.getResultList();
	 }
}
