<?php

class BarangController extends Controller
{
	/**
	 * @var string the default layout for the views. Defaults to '//layouts/column2', meaning
	 * using two-column layout. See 'protected/views/layouts/column2.php'.
	 */
	public $layout = 'main';

	public function init()
	{
		if (Yii::app()->user->isGuest) {
			$this->redirect(array("site/login"));
		}
		$this->widget('SetConfig');
	}

	/**
	 * @return array action filters
	 */
	public function filters()
	{
		return array(
			'accessControl', // perform access control for CRUD operations
			'postOnly + delete', // we only allow deletion via POST request
		);
	}

	/**
	 * Specifies the access control rules.
	 * This method is used by the 'accessControl' filter.
	 * @return array access control rules
	 */
	public function accessRules()
	{
		return array(
			array(
				'allow',  // allow all users to perform 'index' and 'view' actions
				'actions' => array('index', 'view', 'get_detail'),
				'users' => array('*'),
			),
			array(
				'allow', // allow authenticated user to perform 'create' and 'update' actions
				'actions' => array('create', 'update'),
				'users' => array('*'),
			),
			array(
				'allow', // allow admin user to perform 'admin' and 'delete' actions
				'actions' => array('admin', 'delete'),
				'users' => array('*'),
			),
			array(
				'deny',  // deny all users
				'users' => array('*'),
			),
		);
	}

	/**
	 * Displays a particular model.
	 * @param integer $id the ID of the model to be displayed
	 */
	public function actionView($id)
	{
		if (Yii::app()->user->status !== 'owner' && Yii::app()->user->status !== 'admin') {
			$this->redirect(array("dashboard/index"));
		}
		$this->render('view', array(
			'model' => $this->loadModel($id),
		));
	}

	public function actionGet_Detail($id)
	{
		$model = $this->loadModel($id);
		$data['id_barang'] = $model->id_barang;
		$data['nama_barang'] = $model->nama_barang;
		$data['harga_jual'] = $model->harga_jual - (($model->harga_jual * $model->diskon) / 100);
		$data['diskon'] = $model->diskon;

		echo json_encode($data, true);
	}

	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function actionCreate()
	{
		if (Yii::app()->user->status !== 'owner' && Yii::app()->user->status !== 'admin') {
			$this->redirect(array("dashboard/index"));
		}
		$model = new Barang;

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if (isset($_POST['Barang'])) {
			$model->attributes = $_POST['Barang'];
			$model->keuntungan = ($_POST['Barang']['harga_jual'] - $_POST['Barang']['harga_pokok']) - $_POST['Barang']['harga_jual'] / 100 * $_POST['Barang']['diskon'];
			$model->created_at = date('Y-m-d H:i:s');
			$model->updated_at = date('Y-m-d H:i:s');
			if ($model->save())
				$this->redirect(array('view', 'id' => $model->id_barang));
		}

		$this->render('create', array(
			'model' => $model,
		));
	}

	/**
	 * Updates a particular model.
	 * If update is successful, the browser will be redirected to the 'view' page.
	 * @param integer $id the ID of the model to be updated
	 */
	public function actionUpdate($id)
	{
		if (Yii::app()->user->status !== 'owner' && Yii::app()->user->status !== 'admin') {
			$this->redirect(array("dashboard/index"));
		}
		$model = $this->loadModel($id);

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if (isset($_POST['Barang'])) {
			$model->attributes = $_POST['Barang'];
			$model->keuntungan = ($_POST['Barang']['harga_jual'] - $_POST['Barang']['harga_pokok']) - $_POST['Barang']['harga_jual'] / 100 * $_POST['Barang']['diskon'];
			$model->updated_at = date('Y-m-d H:i:s');
			if ($model->save())
				$this->redirect(array('view', 'id' => $model->id_barang));
		}

		$this->render('update', array(
			'model' => $model,
		));
	}

	/**
	 * Deletes a particular model.
	 * If deletion is successful, the browser will be redirected to the 'admin' page.
	 * @param integer $id the ID of the model to be deleted
	 */
	public function actionDelete($id)
	{
		if (Yii::app()->user->status !== 'owner' && Yii::app()->user->status !== 'admin') {
			$this->redirect(array("dashboard/index"));
		}
		$this->loadModel($id)->delete();

		// if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
		if (!isset($_GET['ajax']))
			$this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('admin'));
	}

	/**
	 * Lists all models.
	 */
	public function actionIndex()
	{
		if (Yii::app()->user->status !== 'owner' && Yii::app()->user->status !== 'admin') {
			$this->redirect(array("dashboard/index"));
		}
		$model = new Barang('search');
		$model->unsetAttributes();  // clear any default values
		if (isset($_GET['Barang']))
			$model->attributes = $_GET['Barang'];

		$this->render('admin', array(
			'model' => $model,
		));
	}

	/**
	 * Manages all models.
	 */
	public function actionAdmin()
	{
		if (Yii::app()->user->status !== 'owner' && Yii::app()->user->status !== 'admin') {
			$this->redirect(array("dashboard/index"));
		}
		$model = new Barang('search');
		$model->unsetAttributes();  // clear any default values
		if (isset($_GET['Barang']))
			$model->attributes = $_GET['Barang'];

		$this->render('admin', array(
			'model' => $model,
		));
	}

	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer $id the ID of the model to be loaded
	 * @return Barang the loaded model
	 * @throws CHttpException
	 */
	public function loadModel($id)
	{
		$model = Barang::model()->findByPk($id);
		if ($model === null)
			throw new CHttpException(404, 'The requested page does not exist.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param Barang $model the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if (isset($_POST['ajax']) && $_POST['ajax'] === 'barang-form') {
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
}
