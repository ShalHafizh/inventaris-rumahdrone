<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
 */

Route::get('/', function () {
	return view('auth.login');
});

Auth::routes();

Route::get('dashboard', function () {
	return view('layouts.master');
});

Route::group(['middleware' => ['auth', 'admin']], function () {

	Route::resource('/admin', 'HomeController');
	Route::resource('categories', 'CategoryController');
	Route::get('/apiCategories', 'CategoryController@apiCategories')->name('api.categories');
	Route::get('/exportCategoriesAll', 'CategoryController@exportCategoriesAll')->name('exportPDF.categoriesAll');
	Route::get('/exportCategoriesAllExcel', 'CategoryController@exportExcel')->name('exportExcel.categoriesAll');

	Route::resource('customers', 'CustomerController');
	Route::get('/apiCustomers', 'CustomerController@apiCustomers')->name('api.customers');
	Route::post('/importCustomers', 'CustomerController@ImportExcel')->name('import.customers');
	Route::get('/exportCustomersAll', 'CustomerController@exportCustomersAll')->name('exportPDF.customersAll');
	Route::get('/exportCustomersAllExcel', 'CustomerController@exportExcel')->name('exportExcel.customersAll');

	Route::resource('sales', 'SaleController');
	Route::get('/apiSales', 'SaleController@apiSales')->name('api.sales');
	Route::post('/importSales', 'SaleController@ImportExcel')->name('import.sales');
	Route::get('/exportSalesAll', 'SaleController@exportSalesAll')->name('exportPDF.salesAll');
	Route::get('/exportSalesAllExcel', 'SaleController@exportExcel')->name('exportExcel.salesAll');

	Route::resource('suppliers', 'SupplierController');
	Route::get('/apiSuppliers', 'SupplierController@apiSuppliers')->name('api.suppliers');
	Route::post('/importSuppliers', 'SupplierController@ImportExcel')->name('import.suppliers');
	Route::get('/exportSupplierssAll', 'SupplierController@exportSuppliersAll')->name('exportPDF.suppliersAll');
	Route::get('/exportSuppliersAllExcel', 'SupplierController@exportExcel')->name('exportExcel.suppliersAll');

	Route::resource('products', 'ProductController');
	Route::get('/apiProducts', 'ProductController@apiProducts')->name('api.products');

	Route::resource('productsOut', 'ProductKeluarController');
	Route::get('/apiProductsOut', 'ProductKeluarController@apiProductsOut')->name('api.productsOut');
	Route::get('/exportProductKeluarAll', 'ProductKeluarController@exportProductKeluarAll')->name('exportPDF.productKeluarAll');
	Route::get('/exportProductKeluarAllExcel', 'ProductKeluarController@exportExcel')->name('exportExcel.productKeluarAll');
	Route::get('/exportProductKeluar/{id}', 'ProductKeluarController@exportProductKeluar')->name('exportPDF.productKeluar');

	Route::resource('productsIn', 'ProductMasukController');
	Route::get('/apiProductsIn', 'ProductMasukController@apiProductsIn')->name('api.productsIn');
	Route::get('/exportProductMasukAll', 'ProductMasukController@exportProductMasukAll')->name('exportPDF.productMasukAll');
	Route::get('/exportProductMasukAllExcel', 'ProductMasukController@exportExcel')->name('exportExcel.productMasukAll');
	Route::get('/exportProductMasuk/{id}', 'ProductMasukController@exportProductMasuk')->name('exportPDF.productMasuk');

	Route::resource('users', 'UserController');
	Route::get('/apiUser', 'UserController@apiUsers')->name('api.users');
});

Route::group(['middleware' => ['auth', 'staff']], function () {

	Route::resource('/staff', 'Home2Controller');
	Route::resource('customers-staff', 'Customer2Controller');
	Route::get('/apiCustomers2', 'Customer2Controller@apiCustomers2')->name('api.customers2');
	Route::post('/importCustomers2', 'Customer2Controller@ImportExcel2')->name('import.customers2');

	Route::resource('suppliers-staff', 'Supplier2Controller');
	Route::get('/apiSuppliers2', 'Supplier2Controller@apiSuppliers2')->name('api.suppliers2');

	Route::resource('products-staff', 'Product2Controller');
	Route::get('/apiProducts2', 'Product2Controller@apiProducts2')->name('api.products2');

	Route::resource('productsOut-staff', 'ProductKeluar2Controller');
	Route::get('/apiProductsOut2', 'ProductKeluar2Controller@apiProductsOut2')->name('api.productsOut2');

	Route::resource('productsIn-staff', 'ProductMasuk2Controller');
	Route::get('/apiProductsIn2', 'ProductMasuk2Controller@apiProductsIn2')->name('api.productsIn2');
});
