import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quarizm/cubit/appointment_cubit/appointment_cubit.dart';

class TimeSlots extends StatelessWidget {
  final List<String> slots;
  final String selectedSlot;
  final Function(String) onSlotSelected;

  const TimeSlots({
    super.key,
    required this.slots,
    required this.selectedSlot,
    required this.onSlotSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: slots.where((slot) => !context.read<AppointmentCubit>().bookedTimes.contains(slot)).map((slot) {
        return BlocBuilder<AppointmentCubit, AppointmentState>(
          builder: (context, state) {
            final cubit = context.read<AppointmentCubit>();
            final doctorTime = cubit.time;
            return GestureDetector(
              onTap: () {
                cubit.changeTime(slot);
                onSlotSelected(slot);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: doctorTime == slot ? Colors.greenAccent.shade100 : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey),
                ),
                child: Text(
                  slot,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
