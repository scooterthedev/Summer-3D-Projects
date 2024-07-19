doorThickness = 40;
distanceToFloor = 15;

stopperWidth = 30;
stopperLength = doorThickness * 2.5 + 5;
stopperHeight = distanceToFloor + 5;

rotate([0, 90, 0]) {
  cube([stopperWidth, stopperLength, 2]);

  hull() {
    translate([0, 0, 2]) {
      polyhedron(
          points = [
            [0, 0, 0],
            [stopperWidth, 0, 0],
            [stopperWidth, 3, 0],
            [0, 3, 0],
            [0, doorThickness, stopperHeight],
            [stopperWidth, doorThickness, stopperHeight],
            [stopperWidth, doorThickness, stopperHeight - 2],
            [0, doorThickness, stopperHeight - 2],
          ],
          faces = [
            [0, 1, 2, 3],
            [4, 5, 6, 7],
            [0, 1, 5, 4],
            [2, 3, 7, 6],
            [0, 3, 7, 4],
            [1, 2, 6, 5],
          ]
      );
    }
  }

  hull() {
    translate([0, stopperLength - doorThickness / 2, 2]) {
      polyhedron(
          points = [
            [0, 0, 0],
            [stopperWidth, 0, 0],
            [stopperWidth, doorThickness / 2, 0],
            [0, doorThickness / 2, 0],
            [stopperWidth, 0, stopperHeight],
            [0, 0, stopperHeight],
          ],
          faces = [
            [0, 1, 2, 3],
            [0, 1, 4, 5],
            [4, 5, 3, 2],
            [0, 3, 5],
            [1, 2, 4],
          ]
      );
    }
  }
}