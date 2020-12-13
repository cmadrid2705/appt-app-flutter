import 'package:appt_app/models/staff_model.dart';

class StaffRepository {
  static const _allStaff = <Staff>[
    Staff(
      id: 1,
      name: 'Carlos Lopez',
      bio:
          'Carlos Lopez es uno de los mejores barberos, tiene 10 años de antiguedad en la empresa.',
      imageAsset: 'assets/images/Carlos.jpg',
      availableTimes: [
        '1970-01-01 09:00:00',
        '1970-01-01 10:00:00',
        '1970-01-01 14:00:00',
        '1970-01-01 16:00:00'
      ],
    ),
    Staff(
      id: 2,
      name: 'Josué Fernandez',
      bio:
          'Josué es uno de los mejores barberos, tiene 10 años de antiguedad en la empresa.',
      imageAsset: 'assets/images/Josue.jpg',
      availableTimes: [
        '1970-01-01 08:00:00',
        '1970-01-01 11:00:00',
        '1970-01-01 13:00:00',
        '1970-01-01 18:00:00'
      ],
    ),
    Staff(
      id: 3,
      name: 'Jennifer Diaz',
      bio:
          'Jennifer Diaz es uno de los mejores barberos, tiene 10 años de antiguedad en la empresa.',
      imageAsset: 'assets/images/Jennifer.jpg',
      availableTimes: [
        '1970-01-01 16:00:00',
        '1970-01-01 17:00:00',
        '1970-01-01 19:00:00',
        '1970-01-01 20:00:00'
      ],
    )
  ];

  static List<Staff> loadStaff() {
    return _allStaff;
  }
}
