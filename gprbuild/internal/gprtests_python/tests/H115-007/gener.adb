with Ada.Text_IO; use Ada.Text_IO;

procedure Gener is

   Pkg_Name : String := "pkg_0000";

   procedure Increase is
      N : Positive := Pkg_Name'Last;
   begin
      loop
         if Pkg_Name (N) < '9' then
            Pkg_Name (N) := Character'Succ (Pkg_Name (N));
            exit;

         else
            Pkg_Name (N) := '0';
            N := N - 1;
         end if;
      end loop;
   end Increase;

   Nmb_Pkgs : constant := 1_000;

   File : File_Type;

begin
   for J in 1 .. Nmb_Pkgs loop
      Increase;
      Create (File, Out_File, Pkg_Name & ".ads");
      Put_Line (File, "package " & Pkg_Name & " is end;");
      Close (File);
   end Loop;
end Gener;