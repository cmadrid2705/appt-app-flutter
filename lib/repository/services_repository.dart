import 'package:appt_app/models/services_model.dart';

class ServicesRepository {
  static const _allServices = <Service>[
    Service(
      id: 1,
      description: 'Corte de pelo caballero ',
      price: '130',
      serviceMinutes: 30,
    ),
    Service(
      id: 2,
      description: 'Corte de pelo niño ',
      price: '100',
      serviceMinutes: 25,
    ),
    Service(
      id: 3,
      description: 'Corte de pelo con barba',
      price: '200',
      serviceMinutes:45,
    ),
    Service(
      id: 4,
      description:
          'Barba',
      price: '70',
      serviceMinutes: 15,
    ),
    Service(
      id: 5,
      description: 'Afeitado de cabeza',
      price: '150',
      serviceMinutes: 30,
    ),
    Service(
      id: 6,
      description: 'Limpieza facial',
      price: '100',
      serviceMinutes: 20,
    ),
  ];

  static List<Service> loadServices() {
    return _allServices;
  }
}
