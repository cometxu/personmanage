<?php

namespace sims\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use sims\models\ProjectManagement;

/**
 * ProjectManagementSearch represents the model behind the search form about `sims\models\ProjectManagement`.
 */
class ProjectManagementSearch extends ProjectManagement
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'person', 'state'], 'integer'],
            [['pr_name', 'pro_describe', 'pro_information', 'member'], 'safe'],
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
        $query = ProjectManagement::find();

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
            'person' => $this->person,
            'state' => $this->state,
        ]);

        $query->andFilterWhere(['like', 'pr_name', $this->pr_name])
            ->andFilterWhere(['like', 'pro_describe', $this->pro_describe])
            ->andFilterWhere(['like', 'pro_information', $this->pro_information])
            ->andFilterWhere(['like', 'member', $this->member]);

        return $dataProvider;
    }
}
