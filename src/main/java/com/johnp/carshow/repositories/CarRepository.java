package com.johnp.carshow.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.johnp.carshow.models.Car;

import java.util.List;
import java.util.Optional;

@Repository
public interface CarRepository extends CrudRepository<Car, Long> {

	List<Car> findAll();
	public Optional<Car> findById(Long Id);
}
