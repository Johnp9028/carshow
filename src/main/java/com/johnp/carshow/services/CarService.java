package com.johnp.carshow.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.johnp.carshow.models.Car;
import com.johnp.carshow.repositories.CarRepository;


@Service
public class CarService {

	@Autowired
	private CarRepository repo;
	
	public Car findById(Long id) {
		
		Optional<Car> result = repo.findById(id);
		if(result.isPresent()) {
			return result.get();
		}
		
		return null;
	}
	

	public List<Car> all() {
		return repo.findAll();
	}
	
	public Car create(Car car) {
		return repo.save(car);
	}
	

	public void delete (Long id) {
		repo.deleteById(id);
	
	}
	
	public Car update(Car car) {
		return repo.save(car);
	}
}