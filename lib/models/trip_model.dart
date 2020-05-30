//import 'package:flutter/material.dart';

class Trip {
    String title;
    String description;
    String takeofLocation;
    String destinationLocation;
    DateTime startDate;
    DateTime endDate;
    double budget;
    String travelMode;
    DateTime createdAt;
    String status;
    String notes;

  Trip({
    this.title,
    this.description,
    this.takeofLocation,
    this.destinationLocation,
    this.startDate,
    this.endDate,
    this.budget,
    this.travelMode,
    this.createdAt,
    this.status,
    this.notes});

}