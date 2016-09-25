<?php

namespace sims\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use sims\models\Admin;

/**
 * AdminSearch represents the model behind the search form about `sims\models\Admin`.
 */
class AdminSearch extends Admin
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'gender', 'correspondence_id', 'is_delete'], 'integer'],
            [['username', 'password', 'name', 'role_name'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Admin::find();
        $query ->filterWhere(['is_delete'=>0]);
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);
        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }
        $query->andFilterWhere([
            'id' => $this->id,
            'gender' => $this->gender,
            'correspondence_id' => $this->correspondence_id,
            'is_delete' => $this->is_delete,
        ]);

        $query->andFilterWhere(['like', 'name', $this->name])
            ->andFilterWhere(['like', 'role_name', $this->role_name])
        ;

        return $dataProvider;
    }
}
