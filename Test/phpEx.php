<?php

use Illuminate\Database\Seeder;
use App\Province;
use App\District;
use App\Ward;

class AddressSeeder extends Seeder
{
   /**
    * Run the database seeds.
    *
    * @return void
    */
   public function run()
   {
       $objPHPExcel = PHPExcel_IOFactory::load(base_path('addresses.xls')); // load file ra object PHPExcel
       $provinceSheet = $objPHPExcel->setActiveSheetIndex(0); // Set sheet sẽ được đọc dữ liệu
       $highestRow    = $provinceSheet->getHighestRow(); // Lấy số row lớn nhất trong sheet
       for ($row = 2; $row <= $highestRow; $row++) { // For chạy từ 2 vì row 1 là title
           Province::create([
               'id' => $provinceSheet->getCellByColumnAndRow(0, $row)->getValue(), // lấy dữ liệu từng ô theo col và row
               'name' => $provinceSheet->getCellByColumnAndRow(1, $row)->getValue(),
               'type' => $provinceSheet->getCellByColumnAndRow(2, $row)->getValue(),
           ]);
       }
   
   
       $districtSheet = $objPHPExcel->setActiveSheetIndex(1);
       $highestRow    = $districtSheet->getHighestRow();
       for ($row = 2; $row <= $highestRow; $row++) {
           District::create([
               'id' => $districtSheet->getCellByColumnAndRow(0, $row)->getValue(),
               'name' => $districtSheet->getCellByColumnAndRow(1, $row)->getValue(),
               'type' => $districtSheet->getCellByColumnAndRow(2, $row)->getValue(),
               'location' => $districtSheet->getCellByColumnAndRow(3, $row)->getValue(),
               'province_id' => $districtSheet->getCellByColumnAndRow(4, $row)->getValue(),
           ]);
       }
   
       $wardSheet = $objPHPExcel->setActiveSheetIndex(2);
       $highestRow    = $wardSheet->getHighestRow();
       for ($row = 2; $row <= $highestRow; $row++) {
           Ward::create([
               'id' => $wardSheet->getCellByColumnAndRow(0, $row)->getValue(),
               'name' => $wardSheet->getCellByColumnAndRow(1, $row)->getValue(),
               'type' => $wardSheet->getCellByColumnAndRow(2, $row)->getValue(),
               'location' => $wardSheet->getCellByColumnAndRow(3, $row)->getValue(),
               'district_id' => $wardSheet->getCellByColumnAndRow(4, $row)->getValue(),
           ]);
       }
   }
}