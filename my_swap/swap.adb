with Ada.Text_IO; use Ada.Text_IO;

procedure Swap is

   A : Integer := 3;
   B : Integer := 4;
   C : Integer := 5;

   procedure Swap_f (X, Y : in out Integer) with
      Depends => (X => Y,
                  Y => X),
      Global => null;
   
   procedure Swap_f (X,Y : in out Integer) is
      T : Integer;
   begin
      T := X;
      X := Y;
      Y := T;
   end;
begin
   null;
end;
