package com.mobileshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mobileshop.entities.Manufacturer;

public interface ManufacturerRepository extends JpaRepository<Manufacturer, Long>{

}
